using Microsoft.AspNetCore.Mvc;
using SataWebApi.Interfaces;
using SataWebApi.Models;

namespace SataWebApi.Controllers
{
    [Route("[controller]/[Action]")]
    [ApiController]
    public class AgendaController : ControllerBase
    {
        private readonly IAgendaService _agendaService;
        public AgendaController(IAgendaService agendaService)
        {
            _agendaService = agendaService;
        }

        [HttpGet]
        public async Task<List<AgendaModel>> GetAgendaInfo() => await _agendaService.GetAgendaInfo();
    }
}
