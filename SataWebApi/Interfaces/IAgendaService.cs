using SataWebApi.Entity;
using SataWebApi.Models;

namespace SataWebApi.Interfaces
{
    public interface IAgendaService
    {
        Task<List<AgendaModel>> GetAgendaInfo();
        Task<List<AgendaDay>> GetAgendaDays();
    }
}
