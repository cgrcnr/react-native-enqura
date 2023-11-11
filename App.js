import { StatusBar } from "expo-status-bar";
import { Button, StyleSheet, Text, View } from "react-native";
import {
  hello,
  PI,
  setValueAsync,
  startVerification,
} from "./modules/expo-enqura";
import { preventAutoHideAsync, hideAsync } from "expo-splash-screen";
import { useEffect } from "react";
import { GestureHandlerRootView } from "react-native-gesture-handler";
import {
  createNavigationContainerRef,
  NavigationContainer,
} from "@react-navigation/native";
import MainNavigator from "./navigators/MainNavigator";
import { SafeAreaProvider } from 'react-native-safe-area-context'

preventAutoHideAsync();
export const navigationContainerRef = createNavigationContainerRef();

export default function App() {
  useEffect(() => {
    setTimeout(() => {
      hideAsync();
    }, 5000);
  }, []);

  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <SafeAreaProvider>
          <NavigationContainer ref={navigationContainerRef}>
              <MainNavigator />
          </NavigationContainer>
      </SafeAreaProvider>
    </GestureHandlerRootView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
