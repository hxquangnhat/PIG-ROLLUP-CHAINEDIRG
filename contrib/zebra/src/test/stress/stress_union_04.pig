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

register $zebraJar;
--fs -rmr $outputDir


--a1 = LOAD '$inputDir/25Munsorted1' USING org.apache.hadoop.zebra.pig.TableLoader('count,seed,int2,str2,byte2');
--a2 = LOAD '$inputDir/25Munsorted2' USING org.apache.hadoop.zebra.pig.TableLoader('count,seed,int2,str2,byte2');

--sort1 = order a1 by int2,byte2;
--sort2 = order a2 by int2,byte2;

--store sort1 into '$outputDir/sortedintbyte21' using org.apache.hadoop.zebra.pig.TableStorer('[count,seed,int2,str2,byte2]');
--store sort2 into '$outputDir/sortedintbyte22' using org.apache.hadoop.zebra.pig.TableStorer('[count,seed,int2,str2,byte2]');

rec1 = load '$outputDir/sortedintbyte21' using org.apache.hadoop.zebra.pig.TableLoader();
rec2 = load '$outputDir/sortedintbyte22' using org.apache.hadoop.zebra.pig.TableLoader();

joina = LOAD '$outputDir/sortedintbyte21,$outputDir/sortedintbyte22' USING org.apache.hadoop.zebra.pig.TableLoader('count,seed,int2,str2,byte2', 'sorted');

joinaa = order joina by int2,byte2;
store joinaa into '$outputDir/union4' using org.apache.hadoop.zebra.pig.TableStorer('[count,seed,int2,str2,byte2]');
