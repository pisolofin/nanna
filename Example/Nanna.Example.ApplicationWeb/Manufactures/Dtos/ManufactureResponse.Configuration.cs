using AutoMapper;
using Nanna.AutoMapper;
using Nanna.Example.ApplicationWeb.Manufactures.Entities;

namespace Nanna.Example.ApplicationWeb.Dtos;

public partial record ManufactureeResponse : IAutoMapper
{
    public static void ConfigureAutoMapper(IMapperConfigurationExpression mapping)
    {
        mapping.CreateMap<Manufacture, ManufactureResponse>();
    }
}
