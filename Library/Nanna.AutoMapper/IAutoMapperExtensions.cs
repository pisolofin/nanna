﻿using AutoMapper;
using Nanna.Infrastructure;
using System.Reflection;

namespace Nanna.AutoMapper;

public static class IAutoMapperExtensions
{
    /// <summary>Add calling configuration method for instances of IAutoMapper</summary>
    public static IMapperConfigurationExpression AddNAutoMapperConfiguration(this IMapperConfigurationExpression mapperConfiguration, IEnumerable<Assembly> assemblyToConfigureList)
    {
        assemblyToConfigureList.ExecuteStaticInterfaceMethod(typeof(IAutoMapper), nameof(IAutoMapper.ConfigureAutoMapper), mapperConfiguration);

        return mapperConfiguration;
    }

    /// <summary>Add calling configuration method for instances of IAutoMapper</summary>
    public static IMapperConfigurationExpression AddNAutoMapperConfiguration(this IMapperConfigurationExpression mapperConfiguration)
    {
        var assemblies = AppDomain.CurrentDomain.GetAssemblies();
        mapperConfiguration.AddNAutoMapperConfiguration(assemblies);

        return mapperConfiguration;
    }

}
