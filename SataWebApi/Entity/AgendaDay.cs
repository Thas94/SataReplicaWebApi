using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class AgendaDay
{
    public int DayId { get; set; }

    public DateTime? Date { get; set; }

    public string? TextStyle { get; set; }

    public virtual ICollection<Agenda> Agenda { get; set; } = new List<Agenda>();
}
