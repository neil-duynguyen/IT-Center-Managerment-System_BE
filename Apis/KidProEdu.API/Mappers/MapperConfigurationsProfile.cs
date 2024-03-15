﻿using AutoMapper;
using KidProEdu.Application.ViewModels.AdviseRequestViewModels;
using KidProEdu.Application.ViewModels.BlogViewModels;
using KidProEdu.Application.ViewModels.CategoryEquipmentViewModels;
using KidProEdu.Application.ViewModels.ChildrenViewModels;
using KidProEdu.Application.ViewModels.ClassViewModels;
using KidProEdu.Application.ViewModels.ConfigJobType;
using KidProEdu.Application.ViewModels.ContractViewModels;
using KidProEdu.Application.ViewModels.CourseViewModels;
using KidProEdu.Application.ViewModels.DivisionUserAccountViewModels;
using KidProEdu.Application.ViewModels.DivisionViewModels;
using KidProEdu.Application.ViewModels.DocumentViewModels;
using KidProEdu.Application.ViewModels.EnrollmentViewModels;
using KidProEdu.Application.ViewModels.EquipmentViewModels;
using KidProEdu.Application.ViewModels.LessonViewModels;
using KidProEdu.Application.ViewModels.LocationViewModel;
using KidProEdu.Application.ViewModels.LogEquipmentViewModels;
using KidProEdu.Application.ViewModels.LoginViewModel;
using KidProEdu.Application.ViewModels.NotificationUserViewModels;
using KidProEdu.Application.ViewModels.NotificationViewModels;
using KidProEdu.Application.ViewModels.QuestionViewModels;
using KidProEdu.Application.ViewModels.RatingViewModels;
using KidProEdu.Application.ViewModels.RequestViewModels;
using KidProEdu.Application.ViewModels.RoleViewModels;
using KidProEdu.Application.ViewModels.RoomViewModels;
using KidProEdu.Application.ViewModels.ScheduleViewModels;
using KidProEdu.Application.ViewModels.SkillViewModels;
using KidProEdu.Application.ViewModels.TagViewModels;
using KidProEdu.Application.ViewModels.UserViewModels;
using KidProEdu.Domain.Entities;

namespace KidProEdu.API.Mappers
{
    public class MapperConfigurationsProfile : Profile
    {
        public MapperConfigurationsProfile()
        {

            CreateMap<Role, RoleViewModel>().ReverseMap();

            CreateMap<UserAccount, LoginViewModel>().ReverseMap();
            CreateMap<UserAccount, CreateUserViewModel>().ReverseMap();
            CreateMap<UserAccount, UpdateUserViewModel>().ReverseMap();
            CreateMap<UserViewModel, UserAccount>().ReverseMap().ForMember(des => des.RoleName, src => src.MapFrom(x => x.Role.Name))
                                                                .ForMember(des => des.LocationName, src => src.MapFrom(x => x.Location.Name));

            CreateMap<CreateTagViewModel, Tag>().ReverseMap();
            CreateMap<UpdateTagViewModel, Tag>().ReverseMap();

            CreateMap<CreateLocationViewModel, Location>().ReverseMap();
            CreateMap<UpdateLocationViewModel, Location>().ReverseMap();

            CreateMap<CreateSkillViewModel, Skill>().ReverseMap();
            CreateMap<UpdateSkillViewModel, Skill>().ReverseMap();
            CreateMap<Skill, SkillViewModel>().ReverseMap();

            CreateMap<CreateCategoryEquipmentViewModel, CategoryEquipment>().ReverseMap();
            CreateMap<UpdateCategoryEquipmentViewModel, CategoryEquipment>().ReverseMap();

            CreateMap<RoomViewModel, Room>().ReverseMap().ForMember(des => des.Status, src => src.MapFrom(x => x.Status != null ? (string)x.Status.ToString() : (string?)null));
            CreateMap<CreateRoomViewModel, Room>().ReverseMap();
            CreateMap<UpdateRoomViewModel, Room>().ReverseMap();

            CreateMap<CreateChildrenViewModel, ChildrenProfile>().ReverseMap();
            CreateMap<UpdateChildrenViewModel, ChildrenProfile>().ReverseMap();
            CreateMap<ChildrenViewModel, ChildrenProfile>().ReverseMap();

            CreateMap<CreateEquipmentViewModel, Equipment>().ReverseMap();
            CreateMap<UpdateEquipmentViewModel, Equipment>().ReverseMap();
            CreateMap<Equipment, EquipmentViewModel>().ReverseMap();
            CreateMap<EquipmentManagementViewModel, Equipment>().ReverseMap();

            CreateMap<BlogViewModel, Blog>().ReverseMap().ForMember(des => des.Tags, src => src.MapFrom(x => x.Tags.Select(x => x.TagName)))
                                                          .ForMember(des => des.Author, src => src.MapFrom(x => x.UserAccount.FullName));
            CreateMap<CreateBlogViewModel, Blog>().ReverseMap();
            CreateMap<UpdateBlogViewModel, Blog>().ReverseMap();


            CreateMap<CreateNotificationViewModel, Notification>().ReverseMap();
            //.ForMember(dest => dest.NotificationUser, opt => opt.MapFrom(src => src.CreateNotificationUserViewModels)).ReverseMap();
            CreateMap<CreateNotificationUserViewModel, NotificationUser>().ReverseMap();
            CreateMap<Notification, NotificationWithUserViewModel>().ReverseMap();

            CreateMap<Rating, RatingViewModel>()
                .ForMember(des => des.CourseName, src => src.MapFrom(x => x.Course.Name)).ReverseMap();
            CreateMap<CreateRatingViewModel, Rating>().ReverseMap();
            CreateMap<UpdateRatingViewModel, Rating>().ReverseMap();

            CreateMap<Division, DivisionViewModel>().ReverseMap();
            CreateMap<CreateDivisionViewModel, Division>().ReverseMap();
            CreateMap<UpdateDivisionViewModel, Division>().ReverseMap();

            CreateMap<Lesson, LessonViewModel>().ReverseMap();
            CreateMap<CreateLessonViewModel, Lesson>().ReverseMap();
            CreateMap<UpdateLessonViewModel, Lesson>().ReverseMap();

            CreateMap<QuestionViewModel, Question>().ReverseMap();
            CreateMap<CreateQuestionViewModel, Question>().ReverseMap();
            CreateMap<UpdateQuestionViewModel, Question>().ReverseMap();

            CreateMap<RequestViewModel, Request>().ReverseMap().ForMember(des => des.Status, src => src.MapFrom(x => x.Status != null ? (string)x.Status.ToString() : (string?)null));
            //CreateMap<CreateRequestViewModel, Request>().ReverseMap();
            CreateMap<UpdateRequestViewModel, Request>().ReverseMap();

            CreateMap<CreateCourseViewModel, Course>().ReverseMap();
            CreateMap<CourseViewModel, Course>().ReverseMap().ForMember(des => des.CourseType, src => src.MapFrom(x => x.CourseType != null ? (string)x.CourseType.ToString() : (string?)null));

            CreateMap<ClassViewModel, Class>().ReverseMap().ForMember(des => des.StatusOfClass, src => src.MapFrom(x => x.StatusOfClass != null ? (string)x.StatusOfClass.ToString() : (string?)null));
            CreateMap<CreateClassViewModel, Class>().ReverseMap();
            CreateMap<UpdateClassViewModel, Class>().ReverseMap();

            //CreateMap<RequestUserAccount, CreateRequestUserAccountViewModel>().ReverseMap();

            CreateMap<Resource, DocumentViewModel>().ReverseMap();
            CreateMap<CreateDocumentViewModel, Resource>().ReverseMap();
            CreateMap<UpdateDocumentViewModel, Resource>().ReverseMap();

            CreateMap<LogEquipment, LogEquipmentViewModel>().ReverseMap();
            CreateMap<CreateLogEquipmentViewModel, LogEquipment>().ReverseMap();
            CreateMap<UpdateLogEquipmentViewModel, LogEquipment>().ReverseMap();
            CreateMap<LogEquipmentBorrowedManagementViewModel, LogEquipment>().ReverseMap();
            CreateMap<LogEquipmentRepairManagementViewModel, LogEquipment>().ReverseMap();
            CreateMap<LogEquipmentReturnedManagementViewModel, LogEquipment>().ReverseMap();


            CreateMap<TagViewModel, Tag>().ReverseMap().ForMember(des => des.TagType, src => src.MapFrom(x => x.TagType != null ? (string)x.TagType.ToString() : (string?)null)); ;

            CreateMap<AdviseRequestViewModel, AdviseRequest>().ReverseMap().ForMember(des => des.StatusAdviseRequest, src => src.MapFrom(x => x.StatusAdviseRequest != null ? (string)x.StatusAdviseRequest.ToString() : (string?)null)); ;
            CreateMap<CreateAdviseRequestViewModel, AdviseRequest>().ReverseMap();
            CreateMap<UpdateAdviseRequestViewModel, AdviseRequest>().ReverseMap();

            CreateMap<DivisionUserAccount, DivisionUserAccountViewModel>().ReverseMap();
            CreateMap<CreateDivisionUserAccountViewModel, DivisionUserAccount>().ReverseMap();
            CreateMap<UpdateDivisionUserAccountViewModel, DivisionUserAccount>().ReverseMap();

            CreateMap<EnrollmentViewModel, Enrollment>().ReverseMap().ForMember(des => des.ClassCode, src => src.MapFrom(x => x.Class.ClassCode))
                                                                    .ForMember(des => des.ChildrenName, src => src.MapFrom(x => x.ChildrenProfile.FullName));
            CreateMap<CreateEnrollmentViewModel, Enrollment>().ReverseMap();
            CreateMap<ClassChildrenViewModel, Enrollment>().ReverseMap()
                                                            .ForMember(x => x.ClassId, src => src.MapFrom(x => x.ClassId))
                                                            .ForMember(x => x.ChildrenId, src => src.MapFrom(x => x.ChildrenProfileId))
                                                            .ForMember(x => x.Avatar, src => src.MapFrom(x => x.ChildrenProfile.Avatar))
                                                            .ForMember(x => x.NameChildren, src => src.MapFrom(x => x.ChildrenProfile.FullName));
           
            CreateMap<Contract, ContractViewModel>().ReverseMap()
                .ForMember(des => des.StatusOfContract, src => src.MapFrom(x => x.StatusOfContract != null ? (string)x.StatusOfContract.ToString() : (string?)null));
            CreateMap<CreateContractViewModel, Contract>().ReverseMap();
            CreateMap<UpdateContractViewModel, Contract>().ReverseMap();

            CreateMap<UpdateConfigJobTypeViewModel, ConfigJobType>().ReverseMap();

            CreateMap<Schedule, ScheduleViewModel>().ReverseMap();
            CreateMap<CreateScheduleViewModel, Schedule>().ReverseMap();
            CreateMap<UpdateScheduleViewModel, Schedule>().ReverseMap();
            
        }
    }
}
