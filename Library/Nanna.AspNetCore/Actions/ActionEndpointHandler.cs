using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;

namespace Nanna.AspNetCore.Actions;

public interface IActionConfigure
{
    public static abstract void Configure(WebApplication app);
}

internal class ActionEndpointHandler
{
}
