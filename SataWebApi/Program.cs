using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NSwag.Generation.Processors.Security;
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

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var connectionString = builder.Configuration.GetConnectionString("SataWeb");
builder.Services.AddDbContext<sataweb_dataContext>(options =>
{
    options.UseSqlServer(connectionString, sqlServerOptionsAction: sqloptions =>
    {
        sqloptions.EnableRetryOnFailure(maxRetryCount: 60, maxRetryDelay: TimeSpan.FromSeconds(5), errorNumbersToAdd: null);
        sqloptions.MaxBatchSize(20);
    });
});

//Swagger Document

builder.Services.AddOpenApiDocument(config =>
{
    config.OperationProcessors.Add(new OperationSecurityScopeProcessor("JWT token"));
    config.AddSecurity("Jwt token", new NSwag.OpenApiSecurityScheme
    {
        Type = NSwag.OpenApiSecuritySchemeType.ApiKey,
        Name = "Authorization",
        Description = "Paste the Bearer Jwt token into the field",
        In = NSwag.OpenApiSecurityApiKeyLocation.Header
    });
    config.PostProcess = document =>
    {
        document.Info = new NSwag.OpenApiInfo
        {
            Version = "v1",
            Title = "SataReplicateApi",
            Description = "SataReplicate.Service.Layer"
        };
    };
});

//Jwt

builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(x =>
{
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidIssuer = config["Jwt:Issuer"],
        ValidAudience = config["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["Jwt:Key"])),
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true
    };
});

// Add services to the container.

builder.Services.AddAuthorization();

builder.Services.AddControllers();

builder.Services.AddScoped<IAgendaService, AgendaService>();
builder.Services.AddScoped<IAuthenticationService, AuthenticationService>();
builder.Services.AddAutoMapper(typeof(Program));

builder.Services.AddScoped<sataweb_dataContext>();

var app = builder.Build();
app.UseCors(allowSpecificOrigins);

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    //app.UseSwagger();
    app.UseSwaggerUI();
    app.UseOpenApi();
}

//app.UseSwagger();
//app.UseSwaggerUI();
//app.UseSwaggerUI(c =>
//{
//    c.SwaggerEndpoint("/swagger/v1/swagger.json", "Api v1");
//});

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
