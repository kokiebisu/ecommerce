import * as React from "react";

// import { default as TaskCard } from "../components/card/card-task";
import { TaskCard } from ".";

export default {
  title: "Card",
  component: TaskCard,
};

export const Primary = () => {
  return <TaskCard />;
};

// export const Secondary = Template.bind({});
// Secondary.args = {
//   label: "Button",
// };

// export const Large = Template.bind({});
// Large.args = {
//   size: "large",
//   label: "Button",
// };

// export const Small = Template.bind({});
// Small.args = {
//   size: "small",
//   label: "Button",
// };
