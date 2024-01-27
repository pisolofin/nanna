using Microsoft.EntityFrameworkCore;
using Nanna.Infrastructure;
using System.Reflection;

namespace Nanna.EntityFramework.Persistence;

public static class IHasPersistenceExtensions
{
    /// <summary>Add calling configuration method for instances of IHasPersistence</summary>
    public static ModelBuilder AddIHasPersistenceConfiguration(this ModelBuilder modelBuilder, List<Assembly> assemblyToConfigureList)
    {
        foreach (var assembly in assemblyToConfigureList)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(assembly);
        }

        assemblyToConfigureList.ExecuteStaticInterfaceMethod(typeof(IHasPersistence), nameof(IHasPersistence.ConfigurePersistence), modelBuilder);

        return modelBuilder;
    }

    /// <summary>Add calling configuration method for instances of IHasPersistence</summary>
    public static ModelBuilder AddIHasPersistenceConfiguration(this ModelBuilder modelBuilder)
    {
        var assemblies = AppDomain.CurrentDomain.GetAssemblies().ToList();
        modelBuilder.AddIHasPersistenceConfiguration(assemblies);

        return modelBuilder;
    }
}
