using Microsoft.EntityFrameworkCore;
using Nanna.EntityFramework;

namespace Nanna.Example.Application.Persistance.EntityConfigurations;

public class Room : IHasPersistence
{
    public static void ConfigurePersistence(ModelBuilder modelBuilder)
    {
        var entity = modelBuilder.Entity<Entities.Room>();
        entity.ToTable(nameof(Entities.Room));
        entity.Property(device => device.Name).HasMaxLength(100).IsRequired();

        entity.HasIndex(device => device.Name).IsUnique();
    }
}
