using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nanna.Example.ApplicationWeb.Devices.Actions;

[HttpGet("charts/inverter/channel-current")]
public class GetDevices
{
    public async Task<string> Handle()
    {
        return "Hello World";
    }
}
