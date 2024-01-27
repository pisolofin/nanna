using Microsoft.EntityFrameworkCore;

namespace Nanna.EntityFramework.Persistence;

public abstract class AppDbContext<TDbContext> : DbContext where TDbContext : DbContext
{
    protected AppDbContext(DbContextOptions<TDbContext> options): base(options) { }

    /// <inheritdoc/>
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        PersistenceConfiguration(modelBuilder);
    }

    /// <summary>Configure the persistance for entities</summary>
    protected virtual void PersistenceConfiguration(ModelBuilder modelBuilder)
    {
        modelBuilder.AddIHasPersistenceConfiguration();
    }
}
