using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using SataWebApi.Entity;
using SataWebApi.Interfaces;
using SataWebApi.Models;
using SataWebApi.NewFolder;

namespace SataWebApi.Services
{
    public class AuthenticationService : BaseService, IAuthenticationService
    {
        private readonly IConfiguration _configuration;
        public AuthenticationService(sataweb_dataContext sataweb_DataContext, IMapper mapper, IConfiguration configuration) : base(sataweb_DataContext, mapper) { 
            _configuration = configuration;
        }

        public async Task<SecurityToken> Authenticate(AuthenticationModel model)
        {
            try
            {
                if (!_sataweb_DataContext.Users.Any(x => x.Username == model.UserName && x.Password == model.Password && x.Active == true))
                {
                    return null;
                }

                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]);

                var claims = new List<Claim>
                {
                    new(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
                    new(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                    new Claim("UserName", model.UserName),
                    new Claim("Password", model.Password),
                };

                var sessionTimeOut = Convert.ToInt32(_configuration["SessionTimeOutInMinutes"]);
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(claims),
                    Expires = DateTime.UtcNow.AddMinutes(sessionTimeOut),
                    Issuer = _configuration["Jwt:Issuer"],
                    Audience = _configuration["Jwt:Audience"],
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256),
                };

                return tokenHandler.CreateToken(tokenDescriptor);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
