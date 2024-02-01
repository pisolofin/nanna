using Microsoft.EntityFrameworkCore;
using Nanna.EntityFramework;

namespace Nanna.Example.ApplicationWeb.Devices.Entities;

public partial class Device : IHasPersistence
{
    public static void ConfigurePersistence(ModelBuilder modelBuilder)
    {
        var entity = modelBuilder.Entity<Device>();
        entity.ToTable(nameof(Device));
        entity.Property(device => device.Name).HasMaxLength(100).IsRequired();
    }
}
