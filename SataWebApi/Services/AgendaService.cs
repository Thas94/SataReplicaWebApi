using AutoMapper;
using SataWebApi.Entity;
using SataWebApi.Interfaces;
using SataWebApi.Models;
using SataWebApi.NewFolder;

namespace SataWebApi.Services
{
    public class AgendaService : BaseService, IAgendaService
    {
        public AgendaService(sataweb_dataContext sataweb_DataContext, IMapper mapper) : base(sataweb_DataContext, mapper) { }

        public async Task<List<AgendaDay>> GetAgendaDays()
        {
            var days = new List<AgendaDay>();
            try
            {
                days = _sataweb_DataContext.AgendaDays.Select(x => new AgendaDay { DayId = x.DayId, Date = x.Date.Value, TextStyle = x.TextStyle }).ToList();
            }
            catch (Exception ex)
            {

            }
            return days;
        }

        public async Task<List<AgendaModel>> GetAgendaInfo()
        {
            var results = new List<AgendaModel>();
            try
            {
                results = (from agenda in _sataweb_DataContext.Agendas
                             join topic in _sataweb_DataContext.AgendaTopics on agenda.AgendaTopicId equals topic.AgendaTopicId
                             let speakers = agenda.HasSpeakers == true ? (from link in _sataweb_DataContext.AgendaLinks
                                                                          join spk in _sataweb_DataContext.Speakers on link.SpeakerId equals spk.SpeakerId
                                                                          where link.AgendaId == agenda.AgendaId
                                                                          select new Speaker
                                                                          {
                                                                              SpeakerId = spk.SpeakerId,
                                                                              SpeakerName = spk.SpeakerName
                                                                          }).ToList() : null
                             let facilitator = agenda.HasFacilitators == true ? (from link in _sataweb_DataContext.AgendaLinks
                                                                          join fac in _sataweb_DataContext.Facilitators on link.FacilitatorId equals fac.FacilitatorId
                                                                          where link.AgendaId == agenda.AgendaId
                                                                          select new Facilitator
                                                                          {
                                                                              FacilitatorId = fac.FacilitatorId,
                                                                              FacilitatorName = fac.FacilitatorName
                                                                          }).ToList() : null
                             let panelMemebers = agenda.HasPanelMembers == true ? (from link in _sataweb_DataContext.AgendaLinks
                                                                                 join pan in _sataweb_DataContext.PanelMembers on link.PanelMemberId equals pan.PanelMemberId
                                                                                 where link.AgendaId == agenda.AgendaId
                                                                                 select new PanelMember
                                                                                 {
                                                                                     PanelMemberId = pan.PanelMemberId,
                                                                                     PanelMemberName = pan.PanelMemberName
                                                                                 }).ToList() : null
                             select new AgendaModel
                             {
                                 AgendaId = agenda.AgendaId,
                                 DayId = agenda.AgendaDayId,
                                 Topic = topic.AgendaTopic1,
                                 StartTime = agenda.StartTime,
                                 EndTime = agenda.EndTime,
                                 Speakers = speakers,
                                 Facilitators = facilitator,
                                 PanelMembers = panelMemebers,
                             }).ToList();
            }
            catch(Exception ex) { 
            }
            return results;
        }
    }
}
