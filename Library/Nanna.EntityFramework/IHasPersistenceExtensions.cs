using Microsoft.EntityFrameworkCore;
using Nanna.Infrastructure;
using System.Reflection;

namespace Nanna.EntityFramework;

public static class IHasPersistenceExtensions
{
    /// <summary>Add calling configuration method for instances of IHasPersistence</summary>
    public static ModelBuilder AddNPersistenceConfiguration(this ModelBuilder modelBuilder, IEnumerable<Assembly> assemblyToConfigureList)
    {
        foreach (var assembly in assemblyToConfigureList)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(assembly);
        }

        assemblyToConfigureList.ExecuteStaticInterfaceMethod(typeof(IHasPersistence), nameof(IHasPersistence.ConfigurePersistence), modelBuilder);

        return modelBuilder;
    }

    /// <summary>Add calling configuration method for instances of IHasPersistence</summary>
    public static ModelBuilder AddNPersistenceConfiguration(this ModelBuilder modelBuilder)
    {
        var assemblies = AppDomain.CurrentDomain.GetAssemblies();
        modelBuilder.AddNPersistenceConfiguration(assemblies);

        return modelBuilder;
    }
}
