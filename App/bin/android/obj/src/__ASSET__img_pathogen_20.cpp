// Generated by Haxe 3.4.4
#include <hxcpp.h>

#ifndef INCLUDED___ASSET__img_pathogen_20
#include <__ASSET__img_pathogen_20.h>
#endif
#ifndef INCLUDED_haxe_Resource
#include <haxe/Resource.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_lime_graphics_Image
#include <lime/graphics/Image.h>
#endif
#ifndef INCLUDED_lime_graphics_ImageBuffer
#include <lime/graphics/ImageBuffer.h>
#endif
#ifndef INCLUDED_lime_graphics_ImageType
#include <lime/graphics/ImageType.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_b2d7fa26e7a81d6e_345_new,"__ASSET__img_pathogen_20","new",0xabfe771d,"__ASSET__img_pathogen_20.new","lime/_macros/AssetsMacro.hx",345,0xfe246b98)
HX_LOCAL_STACK_FRAME(_hx_pos_f89e6fe6889d21e0_1_boot,"__ASSET__img_pathogen_20","boot",0xcac2c2d5,"__ASSET__img_pathogen_20.boot","?",1,0x0000003f)

void __ASSET__img_pathogen_20_obj::__construct( ::lime::graphics::ImageBuffer buffer, ::Dynamic offsetX, ::Dynamic offsetY, ::Dynamic width, ::Dynamic height, ::Dynamic color, ::lime::graphics::ImageType type){
            	HX_STACKFRAME(&_hx_pos_b2d7fa26e7a81d6e_345_new)
HXLINE( 382)		super::__construct(null(),null(),null(),null(),null(),null(),null());
HXLINE( 387)		this->_hx___fromBytes(::haxe::Resource_obj::getBytes(::__ASSET__img_pathogen_20_obj::resourceName),null());
            	}

Dynamic __ASSET__img_pathogen_20_obj::__CreateEmpty() { return new __ASSET__img_pathogen_20_obj; }

void *__ASSET__img_pathogen_20_obj::_hx_vtable = 0;

Dynamic __ASSET__img_pathogen_20_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< __ASSET__img_pathogen_20_obj > _hx_result = new __ASSET__img_pathogen_20_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5],inArgs[6]);
	return _hx_result;
}

bool __ASSET__img_pathogen_20_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x371ba4ab) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x371ba4ab;
	} else {
		return inClassId==(int)0x66ea719b;
	}
}

::String __ASSET__img_pathogen_20_obj::resourceName;


hx::ObjectPtr< __ASSET__img_pathogen_20_obj > __ASSET__img_pathogen_20_obj::__new( ::lime::graphics::ImageBuffer buffer, ::Dynamic offsetX, ::Dynamic offsetY, ::Dynamic width, ::Dynamic height, ::Dynamic color, ::lime::graphics::ImageType type) {
	hx::ObjectPtr< __ASSET__img_pathogen_20_obj > __this = new __ASSET__img_pathogen_20_obj();
	__this->__construct(buffer,offsetX,offsetY,width,height,color,type);
	return __this;
}

hx::ObjectPtr< __ASSET__img_pathogen_20_obj > __ASSET__img_pathogen_20_obj::__alloc(hx::Ctx *_hx_ctx, ::lime::graphics::ImageBuffer buffer, ::Dynamic offsetX, ::Dynamic offsetY, ::Dynamic width, ::Dynamic height, ::Dynamic color, ::lime::graphics::ImageType type) {
	__ASSET__img_pathogen_20_obj *__this = (__ASSET__img_pathogen_20_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(__ASSET__img_pathogen_20_obj), true, "__ASSET__img_pathogen_20"));
	*(void **)__this = __ASSET__img_pathogen_20_obj::_hx_vtable;
	__this->__construct(buffer,offsetX,offsetY,width,height,color,type);
	return __this;
}

__ASSET__img_pathogen_20_obj::__ASSET__img_pathogen_20_obj()
{
}

bool __ASSET__img_pathogen_20_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"resourceName") ) { outValue = ( resourceName ); return true; }
	}
	return false;
}

bool __ASSET__img_pathogen_20_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"resourceName") ) { resourceName=ioValue.Cast< ::String >(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *__ASSET__img_pathogen_20_obj_sMemberStorageInfo = 0;
static hx::StaticInfo __ASSET__img_pathogen_20_obj_sStaticStorageInfo[] = {
	{hx::fsString,(void *) &__ASSET__img_pathogen_20_obj::resourceName,HX_HCSTRING("resourceName","\x39","\x7a","\x62","\x90")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static void __ASSET__img_pathogen_20_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(__ASSET__img_pathogen_20_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(__ASSET__img_pathogen_20_obj::resourceName,"resourceName");
};

#ifdef HXCPP_VISIT_ALLOCS
static void __ASSET__img_pathogen_20_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(__ASSET__img_pathogen_20_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(__ASSET__img_pathogen_20_obj::resourceName,"resourceName");
};

#endif

hx::Class __ASSET__img_pathogen_20_obj::__mClass;

static ::String __ASSET__img_pathogen_20_obj_sStaticFields[] = {
	HX_HCSTRING("resourceName","\x39","\x7a","\x62","\x90"),
	::String(null())
};

void __ASSET__img_pathogen_20_obj::__register()
{
	hx::Object *dummy = new __ASSET__img_pathogen_20_obj;
	__ASSET__img_pathogen_20_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("__ASSET__img_pathogen_20","\xab","\xa4","\x1b","\x37");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &__ASSET__img_pathogen_20_obj::__GetStatic;
	__mClass->mSetStaticField = &__ASSET__img_pathogen_20_obj::__SetStatic;
	__mClass->mMarkFunc = __ASSET__img_pathogen_20_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(__ASSET__img_pathogen_20_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< __ASSET__img_pathogen_20_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = __ASSET__img_pathogen_20_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = __ASSET__img_pathogen_20_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = __ASSET__img_pathogen_20_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void __ASSET__img_pathogen_20_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_f89e6fe6889d21e0_1_boot)
HXDLIN(   1)		resourceName = HX_("__ASSET__:image___ASSET__img_pathogen_20",39,17,61,fa);
            	}
}
