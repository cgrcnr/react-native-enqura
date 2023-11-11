import { StatusBar } from "expo-status-bar";
import { Button, StyleSheet, Text, View } from "react-native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import MaterialCommunityIcons from "react-native-vector-icons/MaterialCommunityIcons";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import TabNavigator from "./TabNavigator";
import StackView1 from "../views/StackView1";
import StackView2 from "../views/StackView2";

const Stack = createNativeStackNavigator();

export default function MainNavigator() {
  return (
    <Stack.Navigator
      //initialRouteName="Home"
      screenOptions={({ route, navigation }) => ({
        headerLeft: () => null,
        headerRight: () => null,
      })}
    >
      <Stack.Screen
        name="TABS"
        component={TabNavigator}
        options={{
          headerShown: false,
        }}
      />
      <Stack.Screen
        name="STACK1"
        component={StackView1}
        options={{
          title: "My profile",
        }}
      />
      <Stack.Screen
        name="STACK2"
        component={StackView2}
        options={{
          gestureEnabled: false,
        }}
      />
    </Stack.Navigator>
  );
}
