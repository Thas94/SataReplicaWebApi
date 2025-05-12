using SataWebApi.Entity;

namespace SataWebApi.Models
{
    public class AgendaModel
    {
        public List<Speaker> Speakers { get; set; } = new List<Speaker>();
        public List<Facilitator> Facilitators { get; set; } = new List<Facilitator>();
        public List<PanelMember> PanelMembers { get; set; } = new List<PanelMember>();
        public int AgendaId { get; set; }
        public int DayId { get; set; }
        public string Topic { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }


    }
}
