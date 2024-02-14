using Microsoft.EntityFrameworkCore;
using Nanna.EntityFramework;

namespace Nanna.Example.ApplicationWeb.Manufactures.Entities;

public partial class Manufacture : IHasPersistence
{
    public static void ConfigurePersistence(ModelBuilder modelBuilder)
    {
        var entity = modelBuilder.Entity<Manufacture>();
        entity.ToTable(nameof(Manufacture));
        entity.Property(device => device.Name).HasMaxLength(100).IsRequired();
    }
}
