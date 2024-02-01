using Microsoft.EntityFrameworkCore;

namespace Nanna.EntityFramework;

public interface IHasPersistence
{
    static abstract void ConfigurePersistence(ModelBuilder modelBuilder);
}
