using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class Speaker
{
    public int SpeakerId { get; set; }

    public string? SpeakerName { get; set; }

    public virtual ICollection<AgendaLink> AgendaLinks { get; set; } = new List<AgendaLink>();
}
