using Microsoft.EntityFrameworkCore;
using SataWebApi.Entity;
using SataWebApi.Interfaces;
using SataWebApi.Services;

var builder = WebApplication.CreateBuilder(args);
var allowSpecificOrigins = "AllowSpecificOrigins";
var config = builder.Configuration;


builder.Services.AddCors(options =>
{
    options.AddPolicy(name: allowSpecificOrigins,
        policy =>
        {
            policy.WithOrigins("https://localhost:44311/")
            .AllowAnyHeader()
            .AllowAnyOrigin()
            .AllowAnyMethod();
        });
});
var connectionString = builder.Configuration.GetConnectionString("SataWeb");
builder.Services.AddDbContext<sataweb_dataContext>(options =>
{
    options.UseSqlServer(connectionString, sqlServerOptionsAction: sqloptions =>
    {
        sqloptions.EnableRetryOnFailure(maxRetryCount: 60, maxRetryDelay: TimeSpan.FromSeconds(5), errorNumbersToAdd: null);
        sqloptions.MaxBatchSize(20);
    });
});

// Add services to the container.

builder.Services.AddScoped<IAgendaService, AgendaService>();
builder.Services.AddAutoMapper(typeof(Program));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<sataweb_dataContext>();

var app = builder.Build();
app.UseCors(allowSpecificOrigins);

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
