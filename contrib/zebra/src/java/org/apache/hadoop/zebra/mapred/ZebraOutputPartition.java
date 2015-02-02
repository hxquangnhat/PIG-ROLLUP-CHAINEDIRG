/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.hadoop.zebra.mapred;

import java.io.IOException;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.BytesWritable;
import org.apache.pig.data.Tuple;


public abstract class ZebraOutputPartition  implements Configurable{

  protected  Configuration jobConf;    
    
  @Override
  public void setConf( Configuration conf) {
      jobConf = conf;
  }

  @Override
  public Configuration getConf( ) {
      return jobConf;
  }
  
  public abstract int getOutputPartition(BytesWritable key, Tuple Value)
  throws IOException;
}
