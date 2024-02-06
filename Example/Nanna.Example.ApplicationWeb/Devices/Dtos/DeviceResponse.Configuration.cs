using AutoMapper;
using Nanna.AutoMapper;
using Nanna.Example.ApplicationWeb.Devices.Entities;

namespace Nanna.Example.ApplicationWeb.Dtos;

public partial record DeviceResponse : IAutoMapper
{
    public static void ConfigureAutoMapper(IMapperConfigurationExpression mapping)
    {
        mapping.CreateMap<Device, DeviceResponse>();
    }
}
