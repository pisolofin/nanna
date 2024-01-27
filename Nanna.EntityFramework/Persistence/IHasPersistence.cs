using Microsoft.EntityFrameworkCore;

namespace Nanna.EntityFramework.Persistence;

public interface IHasPersistence
{
    static abstract void ConfigurePersistence(ModelBuilder modelBuilder);
}
