import React from "react"
import { Button, StyleSheet, Text, View } from "react-native"
import { usePermalink } from "../hooks/usePermalink"

export default function TabView1() {
  const permalink = usePermalink()
  return (
    <View style={styles.container}>
      <Text>TabView 1</Text>
      <Button title="Go Stack View 1" onPress={() => permalink.push("STACK1")} />
      <Button title="Go Stack View 2" onPress={() => permalink.push("STACK2")} />
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
})
