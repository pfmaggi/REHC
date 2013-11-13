#include "ExternalstorageBase.h"
#include "common/RhodesApp.h"


namespace rho {

IMPLEMENT_LOGCLASS(CExternalstorageSingletonBase, "Externalstorage");
IMPLEMENT_LOGCLASS(CExternalstorageBase, "Externalstorage");

rho::common::CAutoPtr< CExternalstorageFactoryBase> CExternalstorageFactoryBase::m_pInstance;



///////////////////////////////////////
//string constants definiton 

////////////////////////////////////////////////

CExternalstorageBase::CExternalstorageBase()
{

}
CExternalstorageSingletonBase::CExternalstorageSingletonBase()
{
    RHODESAPP().getExtManager().registerExtension( "Externalstorage", this );
}

CExternalstorageSingletonBase::~CExternalstorageSingletonBase()
{
    CExternalstorageFactoryBase::setInstance(0);
}


}
