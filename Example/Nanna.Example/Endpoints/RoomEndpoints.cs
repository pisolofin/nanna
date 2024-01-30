using Microsoft.EntityFrameworkCore;
using Nanna.Example.Application.Entities;
using Nanna.Example.Application.Persistance;
using Nanna.Example.Common.Dtos;

namespace Nanna.Example.Endpoints;

public static class RoomEndpoints
{
    public static WebApplication UseRoomEndpoints(this WebApplication app)
    {
        app.MapGet("/rooms", async (AppDbContext dbContext) =>
        {
            var rooms = await dbContext.Set<Room>().ToListAsync();
            return Results.Ok(rooms);
        });

        app.MapGet("/rooms/{id}", async (AppDbContext dbContext, int id) =>
        {
            var room = await dbContext.Set<Room>().FindAsync(id);
            if (room == null)
            {
                return Results.NotFound();
            }

            return Results.Ok(room);
        });

        app.MapPost("/rooms", async (AppDbContext dbContext, RoomRequest roomRequest) =>
        {
            var roomCreated = new Room { Name = roomRequest.Name };
            await dbContext.Set<Room>().AddAsync(roomCreated);
            await dbContext.SaveChangesAsync();
            return Results.Created($"/rooms/{roomCreated.Id}", roomCreated);
        });

        app.MapPut("/rooms/{id}", async (AppDbContext dbContext, int id, RoomRequest roomRequest) =>
        {
            var roomEdited = await dbContext.Set<Room>().FirstAsync(room => room.Id == id);
            roomEdited.Name = roomRequest.Name;
            await dbContext.SaveChangesAsync();
            return Results.Ok(roomRequest);
        });

        app.MapDelete("/rooms/{id}", async (AppDbContext dbContext, int id) =>
        {
            var room = await dbContext.Set<Room>().FindAsync(id);
            if (room == null)
            {
                return Results.NotFound();
            }

            dbContext.Set<Room>().Remove(room);
            await dbContext.SaveChangesAsync();
            return Results.Ok();
        });

        return app;
    }
}
