using System.ComponentModel.DataAnnotations;

namespace SataWebApi.Models
{
    public class AuthenticationModel
    {
        [Required]
        public string UserName { get; set; }
        [Required] 
        public string Password { get; set; }
    }
}
