using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class PanelMember
{
    public int PanelMemberId { get; set; }

    public string? PanelMemberName { get; set; }

    public virtual ICollection<AgendaLink> AgendaLinks { get; set; } = new List<AgendaLink>();
}
