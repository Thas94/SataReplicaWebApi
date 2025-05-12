using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class AgendaTopic
{
    public int AgendaTopicId { get; set; }

    public string? AgendaTopic1 { get; set; }

    public virtual ICollection<Agenda> Agenda { get; set; } = new List<Agenda>();
}
