using System;
using System.Collections.Generic;

namespace SataWebApi.Entity;

public partial class User
{
    public int Id { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public bool? Active { get; set; }
}
