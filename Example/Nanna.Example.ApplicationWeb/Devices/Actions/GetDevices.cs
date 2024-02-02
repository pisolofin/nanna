using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Nanna.AspNetCore.Actions;
using Nanna.Example.Application.Persistance;
using Nanna.Example.ApplicationWeb.Devices.Entities;
using Nanna.Example.Application.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;

namespace Nanna.Example.ApplicationWeb.Devices.Actions;

public class GetDevices : IActionEnpointConfigure
{
    public static void Configure(WebApplication app) => app.MapGet("/devices", async (AppDbContext dbContext) =>
    {
        var devices = await dbContext.Set<Device>().ToListAsync();
        return Results.Ok(devices);
    })
    .WithName("GetDevicesList")
    .WithTags("Devices");
}
