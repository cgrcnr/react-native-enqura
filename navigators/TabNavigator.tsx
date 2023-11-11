import { StatusBar } from "expo-status-bar"
import { Button, StyleSheet, Text, View } from "react-native"
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons'
import TabView1 from "../views/TabView1"
import TabView2 from "../views/TabView2"
import TabView3 from "../views/TabView3"

const Tab = createBottomTabNavigator()

export default function TabNavigator() {
    return (
        <Tab.Navigator
          initialRouteName="Feed"
          screenOptions={{
            tabBarActiveTintColor: '#e91e63',
          }}
        >
          <Tab.Screen
            name="TAB1"
            component={TabView1}
            options={{
              tabBarLabel: 'Home',
              tabBarIcon: ({ color, size }) => (
                <MaterialCommunityIcons name="home" color={color} size={size} />
              ),
            }}
          />
          <Tab.Screen
            name="TAB2"
            component={TabView2}
            options={{
              tabBarLabel: 'Updates',
              tabBarIcon: ({ color, size }) => (
                <MaterialCommunityIcons name="bell" color={color} size={size} />
              ),
              tabBarBadge: 3,
            }}
          />
          <Tab.Screen
            name="TAB3"
            component={TabView3}
            options={{
              tabBarLabel: 'Profile',
              tabBarIcon: ({ color, size }) => (
                <MaterialCommunityIcons name="account" color={color} size={size} />
              ),
            }}
          />
        </Tab.Navigator>
      );
}
