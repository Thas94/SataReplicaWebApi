using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using SataWebApi.Interfaces;
using SataWebApi.Models;

namespace SataWebApi.Controllers
{
    [Route("[controller]/[Action]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly IAuthenticationService _authenticationService;
        public AuthenticationController(IAuthenticationService authenticationService)
        {
            _authenticationService = authenticationService;
        }

        [AllowAnonymous]
        [HttpPost]

        public async Task<string> GetToken(AuthenticationModel model)
        {
            SecurityToken token = await _authenticationService.Authenticate(model);
            if (token != null)
                return new JwtSecurityTokenHandler().WriteToken(token);
            else
                return "Invalid credentials";
        }
    }
}
