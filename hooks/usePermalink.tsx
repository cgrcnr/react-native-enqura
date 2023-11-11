import { ParamListBase, useNavigation } from '@react-navigation/native'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'

export type PermalinkDataType = Record<string, unknown>

export type PermalinkProps = {
  push: (route: string, data?: PermalinkDataType) => void
  rePush: (route: string, data?: PermalinkDataType) => void
  goBack: () => void
  reset: (route: string, data?: PermalinkDataType) => void
  popToTop: (route: string, data?: PermalinkDataType) => void
  replace: (route: string, data?: PermalinkDataType) => void
  bringTopAndPush: (
    top: string,
    route: string,
    data?: PermalinkDataType
  ) => void
}

export function usePermalink() {
  const permalink: PermalinkProps = {} as PermalinkProps
  const navigation = useNavigation<NativeStackNavigationProp<ParamListBase>>()

  permalink.goBack = () => {
    navigation.canGoBack()
      ? navigation.goBack()
      : navigation.replace("TABS")
  }

  permalink.push = (route: string, data?: any) => {
    navigation.navigate(route, data)
  }

  permalink.replace = (route: string, data?: any) => {
    navigation.replace(route, data)
  }

  permalink.reset = (route: string, data?: any) => {
    navigation.reset({
      index: 0,
      routes: [{ name: route, params: data }],
    })
  }

  return permalink
}
