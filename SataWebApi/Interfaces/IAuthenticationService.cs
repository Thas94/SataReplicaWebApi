using Microsoft.IdentityModel.Tokens;
using SataWebApi.Models;

namespace SataWebApi.Interfaces
{
    public interface IAuthenticationService
    {
        Task<SecurityToken> Authenticate(AuthenticationModel model);
    }
}
