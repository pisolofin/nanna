using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Localization;
using Microsoft.Extensions.DependencyInjection;

namespace Nanna.AspNetCore.Localizations;

public static class LocalizationExtensions
{
    public static WebApplicationBuilder AddNLocalization(this WebApplicationBuilder builder, string supportedCultureCommaList = "it-IT")
    {
        builder.Services.Configure<RequestLocalizationOptions>(options =>
        {
            var supportedCultureList = supportedCultureCommaList.Split(',');

            options.ApplyCurrentCultureToResponseHeaders = true;
            options.AddSupportedCultures(supportedCultureList);
            options.AddSupportedUICultures(supportedCultureList);
            options.SetDefaultCulture(supportedCultureList.FirstOrDefault() ?? string.Empty);
            options.RequestCultureProviders.Clear();
            options.RequestCultureProviders.Add(new AcceptLanguageHeaderRequestCultureProvider());
        });

        return builder;
    }
}
