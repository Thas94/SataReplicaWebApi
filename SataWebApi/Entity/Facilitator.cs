using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class Facilitator
{
    public int FacilitatorId { get; set; }

    public string? FacilitatorName { get; set; }

    public virtual ICollection<AgendaLink> AgendaLinks { get; set; } = new List<AgendaLink>();
}
