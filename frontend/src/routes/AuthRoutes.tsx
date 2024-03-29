import { useContext, useEffect } from 'react'
import { Outlet, useNavigate } from 'react-router-dom'
import { path } from 'src/constants/path'
import { AppContext, AppContextType } from 'src/contexts/app.context'
import AuthLayout from 'src/layouts/AuthLayout'

function AuthRoutes() {
  const { isAuthenticated } = useContext<AppContextType>(AppContext)
  const navigate = useNavigate()

  useEffect(() => {
    if (isAuthenticated) {
      navigate(path.home)
    }
  }, [])
  // TODO useRoutes
  if (isAuthenticated) {
    return null
  }
  return (
    <AuthLayout>
      <Outlet />
    </AuthLayout>
  )
}

export default AuthRoutes
