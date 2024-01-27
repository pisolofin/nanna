using Microsoft.EntityFrameworkCore;
using Nanna.EntityFramework.Persistence;

namespace Nanna.Example.Application.Persistance;

public class AppDbContext : AppDbContext<AppDbContext>
{
    public AppDbContext(DbContextOptions<AppDbContext> options): base(options) { }
}
