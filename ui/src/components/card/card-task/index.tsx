import { cx } from "@linaria/core";
import * as React from "react";
import { backgroundColor } from "../../../css";

export const TaskCard = () => (
  <div className={cx(backgroundColor.red)}>Task</div>
);
