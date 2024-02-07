using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Nanna.AspNetCore.Actions;
using Nanna.Example.Application.Persistance;
using Nanna.Example.ApplicationWeb.Devices.Entities;
using Nanna.Example.ApplicationWeb.Dtos;

namespace Nanna.Example.ApplicationWeb;

public class CreateDevice : IActionEnpointConfigure
{
    public static void Configure(WebApplication app) => app.MapPost("/devices", async (AppDbContext dbContext, DeviceCreate model) =>
    {
        var device = new Device
        {
            DeviceType = model.DeviceType,
            Name = model.Name
        };
        dbContext.Set<Device>().Add(device);
        Console.WriteLine(device.Id);
        await dbContext.SaveChangesAsync();

        return Results.Created();
    })
    .WithName("CreateDevice")
    .WithTags("Devices");
}
