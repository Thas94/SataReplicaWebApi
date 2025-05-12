using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class Agenda
{
    public int AgendaId { get; set; }

    public int AgendaDayId { get; set; }

    public int AgendaTopicId { get; set; }

    public string StartTime { get; set; } = null!;

    public string EndTime { get; set; } = null!;

    public bool? HasSpeakers { get; set; }

    public bool? HasFacilitators { get; set; }

    public bool? HasPanelMembers { get; set; }

    public virtual AgendaDay AgendaDay { get; set; } = null!;

    public virtual ICollection<AgendaLink> AgendaLinks { get; set; } = new List<AgendaLink>();

    public virtual AgendaTopic AgendaTopic { get; set; } = null!;
}
