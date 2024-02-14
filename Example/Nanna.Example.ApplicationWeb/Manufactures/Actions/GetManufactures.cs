using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Nanna.AspNetCore.Actions;
using Nanna.Example.Application.Persistance;
using Nanna.Example.ApplicationWeb.Dtos;
using Nanna.Example.ApplicationWeb.Manufactures.Entities;

namespace Nanna.Example.ApplicationWeb.Manufactures.Actions;

public class GetManufactures : IActionEnpointConfigure
{
    public static void Configure(WebApplication app) => app.MapGet("/manufactures", async (AppDbContext dbContext, IConfigurationProvider autoMapperConfig) =>
    {
        var manufactureList = await dbContext.Set<Manufacture>().ProjectTo<ManufactureResponse>(autoMapperConfig).ToListAsync();
        return Results.Ok(manufactureList);
    })
    .WithName("GetManufactureList")
    .WithTags("Manufactures")
    .RequireAuthorization();
}
