using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Nanna.AspNetCore.Actions;
using Nanna.Example.Application.Persistance;
using Nanna.Example.ApplicationWeb.Devices.Entities;
using Nanna.Example.ApplicationWeb.Dtos;

namespace Nanna.Example.ApplicationWeb.Devices.Actions;

public class GetDevices : IActionEnpointConfigure
{
    public static void Configure(WebApplication app) => app.MapGet("/devices", async (AppDbContext dbContext, IConfigurationProvider autoMapperConfig) =>
    {
        var deviceList = await dbContext.Set<Device>().ProjectTo<DeviceResponse>(autoMapperConfig).ToListAsync();
        return Results.Ok(deviceList);
    })
    .WithName("GetDeviceList")
    .WithTags("Devices");
}
