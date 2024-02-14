using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Nanna.AspNetCore.Actions;
using Nanna.Example.Application.Persistance;
using Nanna.Example.ApplicationWeb.Devices.Entities;
using Nanna.Example.ApplicationWeb.Dtos;

namespace Nanna.Example.ApplicationWeb;

public class EditDevice : IActionEnpointConfigure
{
    public static void Configure(WebApplication app) => app.MapPut("/devices/{id}", async (AppDbContext dbContext, int id, DeviceEdit model, CancellationToken cancellationToken) =>
    {
        var device = await dbContext
            .Set<Device>()
            .AsNoTracking()
            .Where(device => device.Id == id)
            .FirstAsync(cancellationToken);
        var deviceUpdated = device with
        {
            Name = model.Name
        };
        dbContext.Set<Device>().Update(deviceUpdated);
        await dbContext.SaveChangesAsync(cancellationToken);

        return Results.Ok();
    })
    .WithName("EditDevice")
    .WithTags("Devices");
}
