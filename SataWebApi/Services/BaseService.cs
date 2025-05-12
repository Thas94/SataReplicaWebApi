using AutoMapper;
using SataWebApi.Entity;

namespace SataWebApi.NewFolder
{
    public class BaseService
    {
        public readonly sataweb_dataContext _sataweb_DataContext;
        public readonly IMapper _mapper;

        public BaseService(sataweb_dataContext sataweb_DataContext, IMapper mapper)
        {
            _sataweb_DataContext = sataweb_DataContext;
            _mapper = mapper;
        }
    }
}
