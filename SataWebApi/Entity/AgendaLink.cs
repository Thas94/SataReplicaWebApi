using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class AgendaLink
{
    public int AgendaLinkId { get; set; }

    public int? AgendaId { get; set; }

    public int? SpeakerId { get; set; }

    public int? FacilitatorId { get; set; }

    public int? PanelMemberId { get; set; }

    public virtual Agenda? Agenda { get; set; }

    public virtual Facilitator? Facilitator { get; set; }

    public virtual PanelMember? PanelMember { get; set; }

    public virtual Speaker? Speaker { get; set; }
}
