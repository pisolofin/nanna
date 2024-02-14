using Nanna.Example.ApplicationWeb.Devices.Entities;

namespace Nanna.Example.ApplicationWeb.Dtos;

public partial record DeviceResponse(int Id, string Name, DeviceType DeviceType, int ManufactureId);
