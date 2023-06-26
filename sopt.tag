<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>conjugate_gradient.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/benchmarks/</path>
    <filename>http://astro-informatics.github.io/sopt/benchmarks_2conjugate__gradient_8cc.html</filename>
    <includes id="conjugate__gradient_8h" name="conjugate_gradient.h" local="yes" imported="no">sopt/conjugate_gradient.h</includes>
    <member kind="function">
      <type>void</type>
      <name>matrix_cg</name>
      <anchorfile>benchmarks_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>ae0aae8393480513a27dfab2944c4055a</anchor>
      <arglist>(benchmark::State &amp;state)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>function_cg</name>
      <anchorfile>benchmarks_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>a1f13a158f7684a40baeb025b05716471</anchor>
      <arglist>(benchmark::State &amp;state)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>abb1a5706311d6a6ee6d5c7cdccdd55ff</anchor>
      <arglist>(matrix_cg, sopt::t_complex) -&gt; RangePair(1, 256, 4, 12) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>a0bbd26e41636c14825153171b55d2c83</anchor>
      <arglist>(matrix_cg, sopt::t_real) -&gt; RangePair(1, 256, 4, 12) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>a1694cce5539a1e19e17c74e1c505f7bd</anchor>
      <arglist>(function_cg, sopt::t_complex) -&gt; RangePair(1, 256, 4, 12) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>a5897da3b34d3f4e9222dae946f229d37</anchor>
      <arglist>(function_cg, sopt::t_real) -&gt; RangePair(1, 256, 4, 12) -&gt;UseRealTime()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>conjugate_gradient.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2conjugate__gradient_8cc.html</filename>
    <includes id="conjugate__gradient_8h" name="conjugate_gradient.h" local="yes" imported="no">sopt/conjugate_gradient.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>conjugate_gradient.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tests_2conjugate__gradient_8cc.html</filename>
    <includes id="conjugate__gradient_8h" name="conjugate_gradient.h" local="yes" imported="no">sopt/conjugate_gradient.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2conjugate__gradient_8cc.html</anchorfile>
      <anchor>aabe4e0acbaa3d09bace82a8d7df2afe5</anchor>
      <arglist>(&quot;Conjugate gradient&quot;, &quot;[cg]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l1_proximal.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/benchmarks/</path>
    <filename>http://astro-informatics.github.io/sopt/benchmarks_2l1__proximal_8cc.html</filename>
    <includes id="l1__proximal_8h" name="l1_proximal.h" local="yes" imported="no">sopt/l1_proximal.h</includes>
    <includes id="real__type_8h" name="real_type.h" local="yes" imported="no">sopt/real_type.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>void</type>
      <name>function_l1p</name>
      <anchorfile>benchmarks_2l1__proximal_8cc.html</anchorfile>
      <anchor>ac706381e094e043a54341044d681f705</anchor>
      <arglist>(benchmark::State &amp;state)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2l1__proximal_8cc.html</anchorfile>
      <anchor>a2f8c2f49e3a2b2789a512182489ba37c</anchor>
      <arglist>(function_l1p, sopt::t_complex) -&gt; RangePair(1, 256, 4, 12) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2l1__proximal_8cc.html</anchorfile>
      <anchor>a9c089d0a2a916132316c0983e5fd9d69</anchor>
      <arglist>(function_l1p, sopt::t_real) -&gt; RangePair(1, 256, 4, 12) -&gt;UseRealTime()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l1_proximal.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2l1__proximal_8cc.html</filename>
    <includes id="l1__proximal_8h" name="l1_proximal.h" local="yes" imported="no">sopt/l1_proximal.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2l1__proximal_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelets.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/benchmarks/</path>
    <filename>http://astro-informatics.github.io/sopt/benchmarks_2wavelets_8cc.html</filename>
    <includes id="wavelets_2wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets/wavelets.h</includes>
    <member kind="function">
      <type>unsigned</type>
      <name>get_size</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a3d8449551ba5d70f2cbb04a7479d2356</anchor>
      <arglist>(unsigned requested, unsigned levels)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>get_name</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>ade757ed93840b7fd18371602a9456962</anchor>
      <arglist>(unsigned db)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>direct_matrix</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a599ffff9462018cefe07365d21be4854</anchor>
      <arglist>(benchmark::State &amp;state)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>indirect_matrix</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a9ae9549fbcd61470a2699f1a5f7b7cbe</anchor>
      <arglist>(benchmark::State &amp;state)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>direct_vector</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a516101964bf095729c3a8b81883d3174</anchor>
      <arglist>(benchmark::State &amp;state)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>indirect_vector</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a8009557b89a90e4d40325944dd4b26d6</anchor>
      <arglist>(benchmark::State &amp;state)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a4de8b4557ed17026049b73b7644ec9f5</anchor>
      <arglist>(direct_matrix, sopt::t_complex, 1, 1) -&gt; RangePair(n, N, n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a6b0be8ea6f68c2a107d9e2de11d6ec8f</anchor>
      <arglist>(direct_matrix, sopt::t_real, 1, 1) -&gt; RangePair(n, N, n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a7016c8e61535d63458d9067d64e11b1d</anchor>
      <arglist>(direct_matrix, sopt::t_complex, 10, 1) -&gt; RangePair(n, N, n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a7d85e4f0d3a4d86f388e9a59aa1612ce</anchor>
      <arglist>(direct_vector, sopt::t_complex, 1, 1) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a0c8c3fd73a1f7b65fd106b915125d505</anchor>
      <arglist>(direct_vector, sopt::t_complex, 10, 1) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>aedc2317839a562d4a2dbc58b8872aab9</anchor>
      <arglist>(direct_vector, sopt::t_complex, 1, 2) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a46b4941d201012fcd7963627ec9a990d</anchor>
      <arglist>(direct_vector, sopt::t_real, 1, 1) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a95797837b0e2eca0b2ba7294bf9e7f3a</anchor>
      <arglist>(indirect_matrix, sopt::t_complex, 1, 1) -&gt; RangePair(n, N, n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a19b937594d9501c60950b72b57bf20df</anchor>
      <arglist>(indirect_matrix, sopt::t_real, 1, 1) -&gt; RangePair(n, N, n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>aa3a5950cf1d2ed11e600cceb803d89ca</anchor>
      <arglist>(indirect_matrix, sopt::t_complex, 10, 1) -&gt; RangePair(n, N, n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a6218800b0309178dc6065aa127ee8df1</anchor>
      <arglist>(indirect_vector, sopt::t_complex, 1, 1) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a0232b2b289aa35e385d954aef1c04557</anchor>
      <arglist>(indirect_vector, sopt::t_complex, 10, 1) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a528f0b9d9f5258ecdf84136a763c1f96</anchor>
      <arglist>(indirect_vector, sopt::t_complex, 1, 2) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>BENCHMARK_TEMPLATE</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>aeb542924428312e8a3a87b65a47a480d</anchor>
      <arglist>(indirect_vector, sopt::t_real, 1, 1) -&gt; Range(n, N) -&gt;UseRealTime()</arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>n</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>ab3476af6ef43e8e3137d27a301208cb0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>N</name>
      <anchorfile>benchmarks_2wavelets_8cc.html</anchorfile>
      <anchor>a61a80266d367e479ef40417f4f681bea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelets.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2wavelets_8cc.html</filename>
    <includes id="wavelets_2wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets/wavelets.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2wavelets_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelets.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/sopt_2wavelets_2wavelets_8cc.html</filename>
    <includes id="wavelets_2wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets/wavelets.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
    <member kind="function">
      <type>Wavelet</type>
      <name>factory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a65aedf4b737bb07c94642b42fe99bfab</anchor>
      <arglist>(std::string name=&quot;DB1&quot;, t_uint nlevels=1)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelets.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tests_2wavelets_8cc.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="direct_8h" name="direct.h" local="yes" imported="no">sopt/wavelets/direct.h</includes>
    <includes id="indirect_8h" name="indirect.h" local="yes" imported="no">sopt/wavelets/indirect.h</includes>
    <includes id="wavelet__data_8h" name="wavelet_data.h" local="yes" imported="no">sopt/wavelets/wavelet_data.h</includes>
    <includes id="wavelets_2wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets/wavelets.h</includes>
    <member kind="typedef">
      <type>sopt::Array&lt; sopt::t_uint &gt;</type>
      <name>t_iVector</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a60a6ca32f7529c3853daadce1b8a2173</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>t_iVector</type>
      <name>even</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a8b46878d44ba7f499e8257af574703fb</anchor>
      <arglist>(t_iVector const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>t_iVector</type>
      <name>odd</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a9895f93a232293badd4b6dfe1f050245</anchor>
      <arglist>(t_iVector const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Array&lt; typename T::Scalar, T::RowsAtCompileTime, T::ColsAtCompileTime &gt;</type>
      <name>upsample</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a6e22f7a3bd26f99b5acf9c2bcac1d085</anchor>
      <arglist>(Eigen::ArrayBase&lt; T &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>sopt::t_int</type>
      <name>random_integer</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a2b78fa46a1e414e56828982c20223ced</anchor>
      <arglist>(sopt::t_int min, sopt::t_int max)</arglist>
    </member>
    <member kind="function">
      <type>t_iVector</type>
      <name>random_ivector</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a64a2a9dbab01b616d4173fccaf55c438</anchor>
      <arglist>(sopt::t_int size, sopt::t_int min, sopt::t_int max)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>check_round_trip</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a6b5b47b5996a241cf960b04eaa735fe6</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input_, sopt::t_uint db, sopt::t_uint nlevels=1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>ab2b66cf16b9b74419c8d381158d73906</anchor>
      <arglist>(&quot;wavelet data&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a81238bde1e31d33921ffb3e7d79ee62d</anchor>
      <arglist>(&quot;Wavelet transform innards with integer data&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a20c0e2be606f0eaaf100a1892d8c7361</anchor>
      <arglist>(&quot;1D wavelet transform with floating point data&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>ac8f12d84d1305f6d91870198055c359d</anchor>
      <arglist>(&quot;1D wavelet transform with complex data&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>ad39275a4cb1aa680aedeb2464b3e4718</anchor>
      <arglist>(&quot;2D wavelet transform with real data&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a2a37efd1d987aee6cb7ef027d92645ef</anchor>
      <arglist>(&quot;Functor implementation&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>adce9843c4b45a01ac4e2f213118b584c</anchor>
      <arglist>(&quot;Automatic input resizing&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2wavelets_8cc.html</anchorfile>
      <anchor>a8302a9353fcf7b1d6b6372cc9e556ad3</anchor>
      <arglist>(&quot;Dirac wavelets&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>README.md</name>
    <path>/home/runner/work/sopt/sopt/cpp/docs/</path>
    <filename>http://astro-informatics.github.io/sopt/README_8md.html</filename>
  </compound>
  <compound kind="file">
    <name>SOPT_CONTRIBUTORS.md</name>
    <path>/home/runner/work/sopt/sopt/cpp/docs/</path>
    <filename>http://astro-informatics.github.io/sopt/SOPT__CONTRIBUTORS_8md.html</filename>
  </compound>
  <compound kind="file">
    <name>inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/forward_backward/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2forward__backward_2inpainting_8cc.html</filename>
    <includes id="imaging__forward__backward_8h" name="imaging_forward_backward.h" local="yes" imported="no">sopt/imaging_forward_backward.h</includes>
    <includes id="l1__g__proximal_8h" name="l1_g_proximal.h" local="yes" imported="no">sopt/l1_g_proximal.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2forward__backward_2inpainting_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/primal_dual/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2primal__dual_2inpainting_8cc.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="imaging__primal__dual_8h" name="imaging_primal_dual.h" local="yes" imported="no">sopt/imaging_primal_dual.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="power__method_8h" name="power_method.h" local="yes" imported="no">sopt/power_method.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="sara_8h" name="sara.h" local="yes" imported="no">sopt/wavelets/sara.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2primal__dual_2inpainting_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/proximal_admm/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2proximal__admm_2inpainting_8cc.html</filename>
    <includes id="imaging__padmm_8h" name="imaging_padmm.h" local="yes" imported="no">sopt/imaging_padmm.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2proximal__admm_2inpainting_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/sdmm/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2sdmm_2inpainting_8cc.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="sdmm_8h" name="sdmm.h" local="yes" imported="no">sopt/sdmm.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2sdmm_2inpainting_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tests_2inpainting_8cc.html</filename>
    <includes id="imaging__forward__backward_8h" name="imaging_forward_backward.h" local="yes" imported="no">sopt/imaging_forward_backward.h</includes>
    <includes id="l1__g__proximal_8h" name="l1_g_proximal.h" local="yes" imported="no">sopt/l1_g_proximal.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="typedef">
      <type>double</type>
      <name>Scalar</name>
      <anchorfile>tests_2inpainting_8cc.html</anchorfile>
      <anchor>a8c2981f3f834be9448a6ab06c28748eb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>Vector</name>
      <anchorfile>tests_2inpainting_8cc.html</anchorfile>
      <anchor>a47c194cae73625ab3a13b62e4234f46f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>Matrix</name>
      <anchorfile>tests_2inpainting_8cc.html</anchorfile>
      <anchor>ab86a00c212fb2233871e057014ded6a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Image&lt; Scalar &gt;</type>
      <name>Image</name>
      <anchorfile>tests_2inpainting_8cc.html</anchorfile>
      <anchor>aeeca20f5186519056cf53849afb07e6e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2inpainting_8cc.html</anchorfile>
      <anchor>a4e85c74adb906d5a3d0a1c2be49ebc78</anchor>
      <arglist>(&quot;Inpainting&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>inpainting_credible_interval.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/forward_backward/</path>
    <filename>http://astro-informatics.github.io/sopt/inpainting__credible__interval_8cc.html</filename>
    <includes id="credible__region_8h" name="credible_region.h" local="yes" imported="no">sopt/credible_region.h</includes>
    <includes id="imaging__forward__backward_8h" name="imaging_forward_backward.h" local="yes" imported="no">sopt/imaging_forward_backward.h</includes>
    <includes id="l1__g__proximal_8h" name="l1_g_proximal.h" local="yes" imported="no">sopt/l1_g_proximal.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>inpainting__credible__interval_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>inpainting_joint_map.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/forward_backward/</path>
    <filename>http://astro-informatics.github.io/sopt/inpainting__joint__map_8cc.html</filename>
    <includes id="imaging__forward__backward_8h" name="imaging_forward_backward.h" local="yes" imported="no">sopt/imaging_forward_backward.h</includes>
    <includes id="l1__g__proximal_8h" name="l1_g_proximal.h" local="yes" imported="no">sopt/l1_g_proximal.h</includes>
    <includes id="joint__map_8h" name="joint_map.h" local="yes" imported="no">sopt/joint_map.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>inpainting__joint__map_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l2_inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/forward_backward/</path>
    <filename>http://astro-informatics.github.io/sopt/l2__inpainting_8cc.html</filename>
    <includes id="l2__forward__backward_8h" name="l2_forward_backward.h" local="yes" imported="no">sopt/l2_forward_backward.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>l2__inpainting_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l1_norm.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/l1__norm_8cc.html</filename>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>l1__norm_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>positive_quadrant_projection.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/positive__quadrant__projection_8cc.html</filename>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>positive__quadrant__projection_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>power_method.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2power__method_8cc.html</filename>
    <includes id="power__method_8h" name="power_method.h" local="yes" imported="no">sopt/power_method.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2power__method_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>power_method.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tests_2power__method_8cc.html</filename>
    <includes id="power__method_8h" name="power_method.h" local="yes" imported="no">sopt/power_method.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2power__method_8cc.html</anchorfile>
      <anchor>a1e5f6d9bad29eafb6b4e758309001914</anchor>
      <arglist>(&quot;Power Method&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2power__method_8cc.html</anchorfile>
      <anchor>a273836b390e4833a22c7273992f59812</anchor>
      <arglist>(&quot;Power Method (from Purify)&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tv_inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/primal_dual/</path>
    <filename>http://astro-informatics.github.io/sopt/tv__inpainting_8cc.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="gradient__operator_8h" name="gradient_operator.h" local="yes" imported="no">sopt/gradient_operator.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="power__method_8h" name="power_method.h" local="yes" imported="no">sopt/power_method.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="tv__primal__dual_8h" name="tv_primal_dual.h" local="yes" imported="no">sopt/tv_primal_dual.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>tv__inpainting_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>euclidian_norm.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/proximal_admm/</path>
    <filename>http://astro-informatics.github.io/sopt/proximal__admm_2euclidian__norm_8cc.html</filename>
    <includes id="padmm_8h" name="padmm.h" local="yes" imported="no">sopt/padmm.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>proximal__admm_2euclidian__norm_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>euclidian_norm.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/sdmm/</path>
    <filename>http://astro-informatics.github.io/sopt/sdmm_2euclidian__norm_8cc.html</filename>
    <includes id="sdmm_8h" name="sdmm.h" local="yes" imported="no">sopt/sdmm.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>sdmm_2euclidian__norm_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>reweighted.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/proximal_admm/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2proximal__admm_2reweighted_8cc.html</filename>
    <includes id="imaging__padmm_8h" name="imaging_padmm.h" local="yes" imported="no">sopt/imaging_padmm.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="positive__quadrant_8h" name="positive_quadrant.h" local="yes" imported="no">sopt/positive_quadrant.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="reweighted_8h" name="reweighted.h" local="yes" imported="no">sopt/reweighted.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="sara_8h" name="sara.h" local="yes" imported="no">sopt/wavelets/sara.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2proximal__admm_2reweighted_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>reweighted.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/sdmm/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2sdmm_2reweighted_8cc.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="positive__quadrant_8h" name="positive_quadrant.h" local="yes" imported="no">sopt/positive_quadrant.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="reweighted_8h" name="reweighted.h" local="yes" imported="no">sopt/reweighted.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="sdmm_8h" name="sdmm.h" local="yes" imported="no">sopt/sdmm.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2sdmm_2reweighted_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>reweighted.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tests_2reweighted_8cc.html</filename>
    <includes id="imaging__padmm_8h" name="imaging_padmm.h" local="yes" imported="no">sopt/imaging_padmm.h</includes>
    <includes id="reweighted_8h" name="reweighted.h" local="yes" imported="no">sopt/reweighted.h</includes>
    <class kind="struct">DummyAlgorithm</class>
    <class kind="struct">DummyAlgorithm::DiagnosticAndResult</class>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2reweighted_8cc.html</anchorfile>
      <anchor>ad9c56601bdc12659c0138b11e796c9a7</anchor>
      <arglist>(&quot;L0-Approximation&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>sara.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/examples_2sara_8cc.html</filename>
    <includes id="sara_8h" name="sara.h" local="yes" imported="no">sopt/wavelets/sara.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>examples_2sara_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>sara.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/sopt_2wavelets_2sara_8cc.html</filename>
    <includes id="sara_8h" name="sara.h" local="yes" imported="no">sara.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
  </compound>
  <compound kind="file">
    <name>sara.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tests_2sara_8cc.html</filename>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="sara_8h" name="sara.h" local="yes" imported="no">sopt/wavelets/sara.h</includes>
    <member kind="function">
      <type>sopt::t_int</type>
      <name>random_integer</name>
      <anchorfile>tests_2sara_8cc.html</anchorfile>
      <anchor>a2b78fa46a1e414e56828982c20223ced</anchor>
      <arglist>(sopt::t_int min, sopt::t_int max)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2sara_8cc.html</anchorfile>
      <anchor>ac7522da5be4e528df7a665b87857e1cb</anchor>
      <arglist>(&quot;Check SARA implementation mechanically&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tests_2sara_8cc.html</anchorfile>
      <anchor>aa3455035b804385457ee033cf68862f5</anchor>
      <arglist>(&quot;Linear-transform wrapper&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>soft_threshhold.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/examples/</path>
    <filename>http://astro-informatics.github.io/sopt/soft__threshhold_8cc.html</filename>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>soft__threshhold_8cc.html</anchorfile>
      <anchor>a2b760810e5bb0cfb55f0c7d6d74d4438</anchor>
      <arglist>(int, char const **)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>bisection_method.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/bisection__method_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <member kind="function">
      <type>std::enable_if&lt; std::is_same&lt; t_real, K &gt;::value, K &gt;::type</type>
      <name>bisection_method</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7574fac5dcbb3569bad1e0d08a553406</anchor>
      <arglist>(const K &amp;function_value, const std::function&lt; K(K)&gt; &amp;func, const K &amp;a, const K &amp;b, const t_real &amp;rel_convergence=1e-4)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chained_operators.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/chained__operators_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <member kind="function">
      <type>OperatorFunction&lt; T0 &gt;</type>
      <name>chained_operators</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5e8a990d75711b892ac8bf2f030d8c1e</anchor>
      <arglist>(OperatorFunction&lt; T0 &gt; const &amp;arg0, T const &amp;... args)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>config.in.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/config_8in_8h.html</filename>
    <namespace>sopt</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_HAS_USING</name>
      <anchorfile>config_8in_8h.html</anchorfile>
      <anchor>a5ce389e9b3ea9d9fdd595ac7fe87f517</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_OPENMP</name>
      <anchorfile>config_8in_8h.html</anchorfile>
      <anchor>a9016e90dd58fb15afa1c43eed606a857</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_DO_LOGGING</name>
      <anchorfile>config_8in_8h.html</anchorfile>
      <anchor>a2709857aa231600f607ccd6e9030589f</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MPI</name>
      <anchorfile>config_8in_8h.html</anchorfile>
      <anchor>a4826d863659dcf6bd750eb31eb150107</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_CHAR_ARCH</name>
      <anchorfile>config_8in_8h.html</anchorfile>
      <anchor>aa55538046bd4e40bdb0aaef5f1bd03d5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_LONG_ARCH</name>
      <anchorfile>config_8in_8h.html</anchorfile>
      <anchor>adcc53c0bf8bb6779c066d45ad2ecc66a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_ULONG_ARCH</name>
      <anchorfile>config_8in_8h.html</anchorfile>
      <anchor>ada08a43b44973639e321ea07c2b30b95</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>version</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aad09b58521217893f8f6bb076ade261b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; uint8_t, uint8_t, uint8_t &gt;</type>
      <name>version_tuple</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a67e58ea24374aec8759a251b307a0af4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>gitref</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ae1029fa88c4dddd856802462d2121deb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>default_logging_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a94d9972b630fd6d0e88a914eb3aaaeda</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>default_logger_name</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7d4a92230a7a1fea0033bf12c848c2b8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>constexpr bool</type>
      <name>color_logger</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a8665e2e558cf502796c385e0b350d54d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>constexpr std::size_t</type>
      <name>number_of_threads_in_tests</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad1f7fdbcc2c8d7cdde37b39c2a14ddbb</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>conjugate_gradient.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/conjugate__gradient_8h.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="wrapper_8h" name="wrapper.h" local="yes" imported="no">sopt/wrapper.h</includes>
    <class kind="class">sopt::ConjugateGradient</class>
    <class kind="struct">sopt::ConjugateGradient::Diagnostic</class>
    <class kind="struct">sopt::ConjugateGradient::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
  </compound>
  <compound kind="file">
    <name>cppflow_utils.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/cppflow__utils_8cc.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::cppflowutils</namespace>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a3db2be4ce233b68cb59e14bb41479afa</anchor>
      <arglist>(sopt::Image&lt; double &gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a9dad4c45792a6d14f3cf6663e4cff776</anchor>
      <arglist>(Image&lt; std::complex&lt; double &gt;&gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a74317f4c5fdf3059f4b347a9d295221c</anchor>
      <arglist>(sopt::Vector&lt; double &gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>afb0af3de2fb724ecce66672044e4c893</anchor>
      <arglist>(sopt::Vector&lt; std::complex&lt; double &gt;&gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Map&lt; Eigen::Array&lt; double, Eigen::Dynamic, Eigen::Dynamic &gt; &gt;</type>
      <name>convert_tensor_to_image</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a4144b27a919c778ad025f61dbef1b8ca</anchor>
      <arglist>(std::vector&lt; float &gt; model_output, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="variable">
      <type>const double</type>
      <name>imaginary_threshold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a4974785f862defec690cf6e52f16f78b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>cppflow_utils.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/cppflow__utils_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::cppflowutils</namespace>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a3db2be4ce233b68cb59e14bb41479afa</anchor>
      <arglist>(sopt::Image&lt; double &gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a9dad4c45792a6d14f3cf6663e4cff776</anchor>
      <arglist>(Image&lt; std::complex&lt; double &gt;&gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a74317f4c5fdf3059f4b347a9d295221c</anchor>
      <arglist>(sopt::Vector&lt; double &gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>afb0af3de2fb724ecce66672044e4c893</anchor>
      <arglist>(sopt::Vector&lt; std::complex&lt; double &gt;&gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Map&lt; Eigen::Array&lt; double, Eigen::Dynamic, Eigen::Dynamic &gt; &gt;</type>
      <name>convert_tensor_to_image</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a4144b27a919c778ad025f61dbef1b8ca</anchor>
      <arglist>(std::vector&lt; float &gt; model_output, int image_rows, int image_cols)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>credible_region.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/credible__region_8h.html</filename>
    <includes id="bisection__method_8h" name="bisection_method.h" local="yes" imported="no">sopt/bisection_method.h</includes>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::credible_region</namespace>
    <member kind="function">
      <type>t_real</type>
      <name>compute_energy_upper_bound</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>ae7771317b2309a9557ff17a942c11a48</anchor>
      <arglist>(const t_real &amp;alpha, const Eigen::MatrixBase&lt; T &gt; &amp;solution, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, t_real, t_real &gt;</type>
      <name>find_credible_interval</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a5ceab114eb663ec516f67a9ef5e5b37b</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const std::tuple&lt; t_uint, t_uint, t_uint, t_uint &gt; &amp;region, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;energy_upperbound)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval_grid</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a0bc1aa04714cdc67760cdc70f90d6e26</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const t_uint &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;energy_upperbound)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval_grid</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a241ac6adc49c40d978928329209cf259</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const std::tuple&lt; t_uint, t_uint &gt; &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;energy_upperbound)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>af57d455af6cd9b99c79b033693dce0f8</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const t_uint &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;alpha)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a3265c7688a2a6d5331ed40bccc88ff72</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const std::tuple&lt; t_uint, t_uint &gt; &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;alpha)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>exception.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/exception_8h.html</filename>
    <class kind="class">sopt::Exception</class>
    <namespace>sopt</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_THROW</name>
      <anchorfile>exception_8h.html</anchorfile>
      <anchor>a57974308768f9fafc7107b626a394f4f</anchor>
      <arglist>(MSG)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>forward_backward.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/forward__backward_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::ForwardBackward</class>
    <class kind="struct">sopt::algorithm::ForwardBackward::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ForwardBackward::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>forward__backward_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>g_proximal.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/g__proximal_8h.html</filename>
    <includes id="forward__backward_8h" name="forward_backward.h" local="yes" imported="no">sopt/forward_backward.h</includes>
    <class kind="class">GProximal</class>
  </compound>
  <compound kind="file">
    <name>gradient_operator.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/gradient__operator_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::gradient_operator</namespace>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>a8f7157c3257d858e8a82b16a25f1c60d</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff_adjoint</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>a8c233ee4010dcf7b636342250c83a91c</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff2d</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>a713bf397493dd700519c0d5a45085f89</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x, const t_int rows, const t_int cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff2d_adjoint</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>aa259c5bc7116336d24744351d364e260</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x, const t_int rows, const t_int cols)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>gradient_operator</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>aa02bf3cc5fc1c24460d2173269d27b57</anchor>
      <arglist>(const t_int rows, const t_int cols)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>imaging_forward_backward.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/imaging__forward__backward_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="forward__backward_8h" name="forward_backward.h" local="yes" imported="no">sopt/forward_backward.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="g__proximal_8h" name="g_proximal.h" local="yes" imported="no">sopt/g_proximal.h</includes>
    <class kind="class">sopt::algorithm::ImagingForwardBackward</class>
    <class kind="struct">sopt::algorithm::ImagingForwardBackward::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ImagingForwardBackward::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>imaging__forward__backward_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>imaging_padmm.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/imaging__padmm_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="l1__proximal_8h" name="l1_proximal.h" local="yes" imported="no">sopt/l1_proximal.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="padmm_8h" name="padmm.h" local="yes" imported="no">sopt/padmm.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::ImagingProximalADMM</class>
    <class kind="struct">sopt::algorithm::ImagingProximalADMM::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ImagingProximalADMM::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>imaging__padmm_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>imaging__padmm_8h.html</anchorfile>
      <anchor>aad24c91e578b23e3517f2a44b2cd1d32</anchor>
      <arglist>(VAR, NAME, PROXIMAL)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>imaging_primal_dual.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/imaging__primal__dual_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="l1__proximal_8h" name="l1_proximal.h" local="yes" imported="no">sopt/l1_proximal.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="primal__dual_8h" name="primal_dual.h" local="yes" imported="no">sopt/primal_dual.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::ImagingPrimalDual</class>
    <class kind="struct">sopt::algorithm::ImagingPrimalDual::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ImagingPrimalDual::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>imaging__primal__dual_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>imaging__primal__dual_8h.html</anchorfile>
      <anchor>aad24c91e578b23e3517f2a44b2cd1d32</anchor>
      <arglist>(VAR, NAME, PROXIMAL)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>joint_map.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/joint__map_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="forward__backward_8h" name="forward_backward.h" local="yes" imported="no">sopt/forward_backward.h</includes>
    <includes id="imaging__forward__backward_8h" name="imaging_forward_backward.h" local="yes" imported="no">sopt/imaging_forward_backward.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::JointMAP</class>
    <class kind="struct">sopt::algorithm::JointMAP::DiagnosticAndResultReg</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>joint__map_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l1_g_proximal.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/l1__g__proximal_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="forward__backward_8h" name="forward_backward.h" local="yes" imported="no">sopt/forward_backward.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="g__proximal_8h" name="g_proximal.h" local="yes" imported="no">sopt/g_proximal.h</includes>
    <includes id="l1__proximal_8h" name="l1_proximal.h" local="yes" imported="no">sopt/l1_proximal.h</includes>
    <class kind="class">sopt::algorithm::L1GProximal</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>l1__g__proximal_8h.html</anchorfile>
      <anchor>a7c88c2dcaf3f2db3abc260ee9d77a9b3</anchor>
      <arglist>(VAR, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l1_proximal.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/l1__proximal_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="proximal__expression_8h" name="proximal_expression.h" local="yes" imported="no">sopt/proximal_expression.h</includes>
    <class kind="class">sopt::proximal::L1TightFrame</class>
    <class kind="class">sopt::proximal::L1</class>
    <class kind="struct">sopt::proximal::L1::Diagnostic</class>
    <class kind="struct">sopt::proximal::L1::DiagnosticAndResult</class>
    <class kind="class">sopt::proximal::L1::FistaMixing</class>
    <class kind="class">sopt::proximal::L1::NoMixing</class>
    <class kind="class">sopt::proximal::L1::Breaker</class>
    <namespace>sopt</namespace>
    <namespace>sopt::proximal</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>l1__proximal_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>l1__proximal_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l2_forward_backward.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/l2__forward__backward_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="forward__backward_8h" name="forward_backward.h" local="yes" imported="no">sopt/forward_backward.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::L2ForwardBackward</class>
    <class kind="struct">sopt::algorithm::L2ForwardBackward::Diagnostic</class>
    <class kind="struct">sopt::algorithm::L2ForwardBackward::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>l2__forward__backward_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>l2_primal_dual.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/l2__primal__dual_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="primal__dual_8h" name="primal_dual.h" local="yes" imported="no">sopt/primal_dual.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::ImagingPrimalDual</class>
    <class kind="struct">sopt::algorithm::ImagingPrimalDual::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ImagingPrimalDual::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>l2__primal__dual_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>l2__primal__dual_8h.html</anchorfile>
      <anchor>aad24c91e578b23e3517f2a44b2cd1d32</anchor>
      <arglist>(VAR, NAME, PROXIMAL)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>linear_transform.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/linear__transform_8h.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="wrapper_8h" name="wrapper.h" local="yes" imported="no">sopt/wrapper.h</includes>
    <class kind="class">sopt::details::MatrixToLinearTransform</class>
    <class kind="class">sopt::details::MatrixAdjointToLinearTransform</class>
    <class kind="class">sopt::LinearTransform</class>
    <class kind="class">sopt::details::MatrixToLinearTransform</class>
    <class kind="class">sopt::details::MatrixAdjointToLinearTransform</class>
    <namespace>sopt</namespace>
    <namespace>sopt::details</namespace>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a27b8391ddefe157e732bebe05696170e</anchor>
      <arglist>(OperatorFunction&lt; VECTOR &gt; const &amp;direct, OperatorFunction&lt; VECTOR &gt; const &amp;indirect, std::array&lt; t_int, 3 &gt; const &amp;sizes={{1, 1, 0}})</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a424b3b158a6f6c45c97eb244c688b429</anchor>
      <arglist>(OperatorFunction&lt; VECTOR &gt; const &amp;direct, std::array&lt; t_int, 3 &gt; const &amp;dsizes, OperatorFunction&lt; VECTOR &gt; const &amp;indirect, std::array&lt; t_int, 3 &gt; const &amp;isizes)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt; &amp;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a74ca3f91c20ceee3bb34066eda6824b8</anchor>
      <arglist>(LinearTransform&lt; VECTOR &gt; &amp;passthrough)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5d99abe8892d0073763dedb050b95dd3</anchor>
      <arglist>(details::WrapFunction&lt; VECTOR &gt; const &amp;direct, details::WrapFunction&lt; VECTOR &gt; const &amp;adjoint)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; typename DERIVED::Scalar &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a09baebf7a38995a5fde7f7b4130ddcbe</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;A)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; SCALAR &gt; &gt;</type>
      <name>linear_transform_identity</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>abf425c6640b07e4b2718d0a0db4c9cdd</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>logging.disabled.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/logging_8disabled_8h.html</filename>
    <namespace>sopt</namespace>
    <namespace>sopt::logging</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_LOG_</name>
      <anchorfile>logging_8disabled_8h.html</anchorfile>
      <anchor>aa64f240f46ed8708082955c6d66ff13f</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>initialize</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a120bb1caf65f04fc7d86c0914bb68713</anchor>
      <arglist>(std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>initialize</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>aa7efdb8dfaa270a5ee5915c08a64ebaa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>get</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a9f0cee3c49d8f62c122e5f83dddd610d</anchor>
      <arglist>(std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>get</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a5109e37f29d40ef6695c4291fcbb063d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a1a3ff36211cc8e01a397f484fb967f41</anchor>
      <arglist>(std::string const &amp;level, std::string const &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a7f2d11c952cce70b2a92c7402c14d2f6</anchor>
      <arglist>(std::string const &amp;)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>has_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>adfbe0795d12d3119704baf0f64dc9d3c</anchor>
      <arglist>(std::string const &amp;, std::string const &amp;)</arglist>
    </member>
    <member kind="variable">
      <type>const std::string</type>
      <name>name_prefix</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a6c538b24670a61401f0fabf038e07931</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>logging.enabled.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/logging_8enabled_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::logging</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>logging_8enabled_8h.html</anchorfile>
      <anchor>a1ed0e99f6e0e5337f165d2590412052b</anchor>
      <arglist>(LEVEL)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>logging_8enabled_8h.html</anchorfile>
      <anchor>a1ed0e99f6e0e5337f165d2590412052b</anchor>
      <arglist>(LEVEL)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_LOG_</name>
      <anchorfile>logging_8enabled_8h.html</anchorfile>
      <anchor>aa3140c50e21c9f1b55df324632c73a77</anchor>
      <arglist>(NAME, TYPE,...)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a1a3ff36211cc8e01a397f484fb967f41</anchor>
      <arglist>(std::string const &amp;level, std::string const &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>initialize</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a120bb1caf65f04fc7d86c0914bb68713</anchor>
      <arglist>(std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>get</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a9f0cee3c49d8f62c122e5f83dddd610d</anchor>
      <arglist>(std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>has_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>adfbe0795d12d3119704baf0f64dc9d3c</anchor>
      <arglist>(std::string const &amp;, std::string const &amp;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>logging.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/logging_8h.html</filename>
    <includes id="logging_8disabled_8h" name="logging.disabled.h" local="yes" imported="no">sopt/logging.disabled.h</includes>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_NOTICE</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>a0a79e962d24082188462673ac047331d</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_ERROR</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>a647ff10c7a51d06f45a5cf5856f30ea8</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_WARN</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>abd1d61c2422ec3ea1ffcfd497acae7e6</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_INFO</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>abdd5945cf65d3237a167bda06a71aaae</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_DEBUG</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>af43ef2984bde80ff9ff844540be74425</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_TRACE</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>a7409cc356d0a5c6a8ce41da7a680ff62</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_HIGH_LOG</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>a5bb43e65962554be1a16134dc4d0dba0</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MEDIUM_LOG</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>add63e5a2a432d1c74e89ac839cea59ec</anchor>
      <arglist>(...)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_LOW_LOG</name>
      <anchorfile>logging_8h.html</anchorfile>
      <anchor>a4a497e6b273bf510772846ac52cef095</anchor>
      <arglist>(...)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>maths.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/maths_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::details::ProjectPositiveQuadrant</class>
    <class kind="class">sopt::details::ProjectPositiveQuadrant&lt; std::complex&lt; SCALAR &gt; &gt;</class>
    <namespace>sopt</namespace>
    <namespace>sopt::details</namespace>
    <member kind="typedef">
      <type>decltype(std::bind(soft_threshhold&lt; SCALAR &gt;, std::placeholders::_1, typename real_type&lt; SCALAR &gt;::type(1)))</type>
      <name>SoftThreshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1details.html</anchorfile>
      <anchor>a9b2c8778a2d73aff0499c9f899fe16df</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T::Scalar &gt;::type</type>
      <name>standard_deviation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a239b0c108ec581a5b5f0c39276aefad8</anchor>
      <arglist>(Eigen::ArrayBase&lt; T &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T::Scalar &gt;::type</type>
      <name>standard_deviation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a009292a23363f1e290a92ce6a2786065</anchor>
      <arglist>(Eigen::MatrixBase&lt; T &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_arithmetic&lt; SCALAR &gt;::value or is_complex&lt; SCALAR &gt;::value, SCALAR &gt;::type</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a6494afff8ee7f1196ff67ce646359d3e</anchor>
      <arglist>(SCALAR const &amp;x, typename real_type&lt; SCALAR &gt;::type const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::CwiseUnaryOp&lt; const details::ProjectPositiveQuadrant&lt; typename T::Scalar &gt;, const T &gt;</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a430768559bd58eab9a93942fb99d1918</anchor>
      <arglist>(Eigen::DenseBase&lt; T &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::CwiseUnaryOp&lt; const details::SoftThreshhold&lt; typename T::Scalar &gt;, const T &gt;</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ac02ea9b606e6a1eef171de3447c77bc1</anchor>
      <arglist>(Eigen::DenseBase&lt; T &gt; const &amp;input, typename real_type&lt; typename T::Scalar &gt;::type const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_arithmetic&lt; typename T0::Scalar &gt;::value and std::is_arithmetic&lt; typename T1::Scalar &gt;::value, Eigen::CwiseBinaryOp&lt; typename T0::Scalar(*)(typename T0::Scalar const &amp;, typename T1::Scalar const &amp;), const T0, const T1 &gt; &gt;::type</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a3047abf694788f24705a1c656a250510</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; const &amp;input, Eigen::DenseBase&lt; T1 &gt; const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; typename T0::Scalar &gt;::value and std::is_arithmetic&lt; typename T1::Scalar &gt;::value, Eigen::CwiseBinaryOp&lt; typename T0::Scalar(*)(typename T0::Scalar const &amp;, typename T0::Scalar const &amp;), const T0, decltype(std::declval&lt; const T1 &gt;).template cast&lt; typename T0::Scalar &gt;))&gt; &gt;::type</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aa14309c45de330f8915e1ffd75fa8164</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; const &amp;input, Eigen::DenseBase&lt; T1 &gt; const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad992ab663c3f521cad1deff62844c4cc</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input, Eigen::ArrayBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a2db42dd287d02a4ff3ce6b7fa2f40857</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input, Eigen::MatrixBase&lt; T1 &gt; const &amp;weight)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aa8f62b39e20496c485d78f97f9afa3e4</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5dac30fa2304a47833ce101737cebdbb</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ae78479408b10b1fa67e712247d4eefec</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input, Eigen::ArrayBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a57c3c1377f0345d2d3a5e5e16ae824e4</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input, Eigen::MatrixBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aaae7c4b4b28cf09cb81be6bdc78d2acd</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>acc5e68fec339ce3ea64dd578483c1a19</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a1f08c74e9b2cac9f30e52c2c6bdbd0f5</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input, Eigen::ArrayBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ae0a7db0a39348c31cdb1475fbeb26c84</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input, Eigen::MatrixBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a1967222064d29c760e307ece5da21168</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a96b301acf3c109ea862ff9e563d2a164</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>t_int</type>
      <name>gcd</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1details.html</anchorfile>
      <anchor>a19d03d9b49ed12e7f7b91cb8b19e1db2</anchor>
      <arglist>(t_int a, t_int b)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>communicator.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/mpi/</path>
    <filename>http://astro-informatics.github.io/sopt/sopt_2mpi_2communicator_8cc.html</filename>
    <includes id="communicator_8h" name="communicator.h" local="yes" imported="no">sopt/mpi/communicator.h</includes>
    <includes id="session_8h" name="session.h" local="yes" imported="no">sopt/mpi/session.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::mpi</namespace>
  </compound>
  <compound kind="file">
    <name>communicator.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tests_2communicator_8cc.html</filename>
    <includes id="communicator_8h" name="communicator.h" local="yes" imported="no">sopt/mpi/communicator.h</includes>
  </compound>
  <compound kind="file">
    <name>communicator.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/mpi/</path>
    <filename>http://astro-informatics.github.io/sopt/communicator_8h.html</filename>
    <includes id="session_8h" name="session.h" local="yes" imported="no">sopt/mpi/session.h</includes>
  </compound>
  <compound kind="file">
    <name>registered_types.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/mpi/</path>
    <filename>http://astro-informatics.github.io/sopt/registered__types_8cc.html</filename>
    <includes id="registered__types_8h" name="registered_types.h" local="yes" imported="no">sopt/mpi/registered_types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::mpi</namespace>
  </compound>
  <compound kind="file">
    <name>registered_types.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/mpi/</path>
    <filename>http://astro-informatics.github.io/sopt/registered__types_8h.html</filename>
  </compound>
  <compound kind="file">
    <name>session.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/mpi/</path>
    <filename>http://astro-informatics.github.io/sopt/session_8cc.html</filename>
    <includes id="session_8h" name="session.h" local="yes" imported="no">sopt/mpi/session.h</includes>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::mpi</namespace>
    <namespace>sopt::mpi::details</namespace>
    <member kind="function">
      <type>std::shared_ptr&lt; details::initializer &gt;</type>
      <name>init</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>ad052cd83bbb11581f623f15e2a97b796</anchor>
      <arglist>(int argc, const char **argv)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; details::initializer &gt;</type>
      <name>session_singleton</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>a9f86b7b10e3a957b50d295c7b9a2040a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>initialized</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>ad44f35d3f51dfcc0fc3b40867f9dd6f3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>finalized</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>a92069429796f1e2f2263162af26bbdb7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>finalize</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>abfd53bf09013dc265c50e4c1ca0773e5</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>session.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/mpi/</path>
    <filename>http://astro-informatics.github.io/sopt/session_8h.html</filename>
    <namespace>sopt</namespace>
    <namespace>sopt::mpi</namespace>
    <member kind="function">
      <type>std::shared_ptr&lt; details::initializer &gt;</type>
      <name>init</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>ad052cd83bbb11581f623f15e2a97b796</anchor>
      <arglist>(int argc, const char **argv)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>initialized</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>ad44f35d3f51dfcc0fc3b40867f9dd6f3</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>utilities.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/mpi/</path>
    <filename>http://astro-informatics.github.io/sopt/mpi_2utilities_8h.html</filename>
  </compound>
  <compound kind="file">
    <name>utilities.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/utilities_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::utilities</namespace>
    <member kind="function">
      <type>Image</type>
      <name>read_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a571717c98b97e19d3d47d8507bb32a8a</anchor>
      <arglist>(std::string const &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a18ac636e4a560294191b1066bc3599b4</anchor>
      <arglist>(Image&lt;&gt; const &amp;image, std::string const &amp;filename)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>objective_functions.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/objective__functions_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::objective_functions</namespace>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a05459b3a0a0e163d2501deca1bf0c4ad</anchor>
      <arglist>(const std::function&lt; t_real(T)&gt; &amp;g, const t_real &amp;sig, const T &amp;y, const sopt::OperatorFunction&lt; T &gt; &amp;measurement_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_L1_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a5038115d2ed074e7239812b338d57524</anchor>
      <arglist>(const t_real &amp;gamma, const t_real &amp;sig, const T &amp;y, const sopt::OperatorFunction&lt; T &gt; &amp;measurement_operator, const sopt::LinearTransform&lt; T &gt; &amp;wavelet_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a0ff3f5cdedb39448a8fba43492413872</anchor>
      <arglist>(const std::function&lt; t_real(T)&gt; &amp;g, const t_real &amp;sig, const T &amp;y, const sopt::LinearTransform&lt; T &gt; &amp;measurement_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_l1_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a121b17bc750fe21815f86cc3d790c3a3</anchor>
      <arglist>(const t_real &amp;gamma, const t_real &amp;sig, const T &amp;y, const sopt::LinearTransform&lt; T &gt; &amp;measurement_operator, const sopt::LinearTransform&lt; T &gt; &amp;wavelet_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_l1_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a8df7f628fc3eb79b95e541a6dd40e256</anchor>
      <arglist>(const t_real &amp;gamma, const t_real &amp;sig, const T &amp;y, const sopt::OperatorFunction&lt; T &gt; &amp;measurement_operator, const sopt::LinearTransform&lt; T &gt; &amp;wavelet_operator)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>padmm.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/padmm_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::ProximalADMM</class>
    <class kind="struct">sopt::algorithm::ProximalADMM::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ProximalADMM::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>padmm_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>positive_quadrant.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/positive__quadrant_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::PositiveQuadrant</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="function">
      <type>PositiveQuadrant&lt; ALGORITHM &gt;</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a628797940cd6549ca3aecadbb22d9642</anchor>
      <arglist>(ALGORITHM const &amp;algo)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>power_method.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/power__method_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::PowerMethod</class>
    <class kind="struct">sopt::algorithm::PowerMethod::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>power__method_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, T &gt;</type>
      <name>power_method</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a87e4a19b5c34cea6a2a490720d43a018</anchor>
      <arglist>(const sopt::LinearTransform&lt; T &gt; &amp;op, const t_uint niters, const t_real relative_difference, const T &amp;initial_vector)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, T, std::shared_ptr&lt; sopt::LinearTransform&lt; T &gt; &gt; &gt;</type>
      <name>normalise_operator</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a24d048a91054bfe01cf3b345c8783e9a</anchor>
      <arglist>(const std::shared_ptr&lt; sopt::LinearTransform&lt; T &gt; const &gt; &amp;op, const t_uint &amp;niters, const t_real &amp;relative_difference, const T &amp;initial_vector)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, T, sopt::LinearTransform&lt; T &gt; &gt;</type>
      <name>normalise_operator</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a565417b5171e614cc9faa5d503ee0a25</anchor>
      <arglist>(const sopt::LinearTransform&lt; T &gt; &amp;op, const t_uint &amp;niters, const t_real &amp;relative_difference, const T &amp;initial_vector)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>primal_dual.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/primal__dual_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::PrimalDual</class>
    <class kind="struct">sopt::algorithm::PrimalDual::Diagnostic</class>
    <class kind="struct">sopt::algorithm::PrimalDual::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>primal__dual_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>proximal.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/proximal_8h.html</filename>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="proximal__expression_8h" name="proximal_expression.h" local="yes" imported="no">sopt/proximal_expression.h</includes>
    <class kind="class">sopt::proximal::EuclidianNorm</class>
    <class kind="class">sopt::proximal::L2Norm</class>
    <class kind="class">sopt::proximal::L2Ball</class>
    <class kind="class">sopt::proximal::WeightedL2Ball</class>
    <class kind="class">sopt::proximal::Translation</class>
    <namespace>sopt</namespace>
    <namespace>sopt::proximal</namespace>
    <member kind="function">
      <type>auto</type>
      <name>euclidian_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a8180be6d4895ccd9238026edcd34f29c</anchor>
      <arglist>(typename real_type&lt; typename T0::Scalar &gt;::type const &amp;t, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) -&gt; decltype(EuclidianNorm(), t, x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>acaa892cd8aec7d5e6c4f24192cbca062</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>ad54f6b698f54216589e33fa3a524952e</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T2 &gt; const &amp;gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a539249fec2aa941ca7eb05a2c781cf2f</anchor>
      <arglist>(Vector&lt; S &gt; &amp;out, typename real_type&lt; S &gt;::type gamma, Vector&lt; S &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a0a6be3a9f2561a2052ce5c360050d3eb</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>ae20cac74655c396bc0d68bdbc32dfcc4</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T2 &gt; const &amp;gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a73e1a321c1a8cab8911d645554df46f7</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a83cc90cb666c06a40790b8b9838e3c6f</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T2 &gt; const &amp;gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>id</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a22e3b74782df4c0aa0058babbc4ddd89</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>af3353b451839ced4b6d7161ac18e13ba</anchor>
      <arglist>(typename real_type&lt; typename T::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T &gt; const &amp;x) -&gt; decltype(sopt::soft_threshhold(x, gamma))</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a53e4faa743a776d115e18d70de58e9eb</anchor>
      <arglist>(Vector&lt; T &gt; &amp;out, typename real_type&lt; T &gt;::type, Vector&lt; T &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>Translation&lt; FUNCTION, VECTOR &gt;</type>
      <name>translate</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a17596cc6d16f2509de806a199fd2f5a9</anchor>
      <arglist>(FUNCTION const &amp;func, VECTOR const &amp;translation)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>proximal_expression.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/proximal__expression_8h.html</filename>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <class kind="class">sopt::proximal::details::DelayedProximalFunction</class>
    <class kind="class">sopt::proximal::details::DelayedProximalEnveloppeFunction</class>
    <class kind="struct">Eigen::internal::traits&lt; sopt::proximal::details::DelayedProximalFunction&lt; FUNCTION, VECTOR &gt; &gt;</class>
    <class kind="struct">Eigen::internal::traits&lt; sopt::proximal::details::DelayedProximalEnveloppeFunction&lt; FUNCTION, VECTOR &gt; &gt;</class>
    <namespace>sopt</namespace>
    <namespace>sopt::proximal</namespace>
    <namespace>sopt::proximal::details</namespace>
    <namespace>Eigen</namespace>
    <namespace>Eigen::internal</namespace>
    <member kind="typedef">
      <type>details::DelayedProximalFunction&lt; FUNC, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>ProximalExpression</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>afc69dd3459e51c1420b9ed6823380cb9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>details::DelayedProximalEnveloppeFunction&lt; FUNC, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>EnveloppeExpression</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a88919b4345cfb37ca55835bb09b1b1e2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>real_type.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/real__type_8h.html</filename>
    <class kind="struct">sopt::details::HasValueType</class>
    <class kind="struct">sopt::details::HasValueType::Fallback</class>
    <class kind="struct">sopt::details::HasValueType::Fallback::value_type</class>
    <class kind="struct">sopt::details::HasValueType::Derived</class>
    <class kind="struct">sopt::details::HasValueType&lt; T, typename std::enable_if&lt; std::is_fundamental&lt; T &gt;::value &gt;::type &gt;</class>
    <class kind="class">sopt::details::has_value_type</class>
    <class kind="class">sopt::details::has_value_type&lt; T, true &gt;</class>
    <class kind="class">sopt::details::has_value_type&lt; T, false &gt;</class>
    <class kind="class">sopt::details::underlying_value_type</class>
    <class kind="class">sopt::details::underlying_value_type&lt; T, false &gt;</class>
    <class kind="class">sopt::details::underlying_value_type&lt; T, true &gt;</class>
    <class kind="struct">sopt::is_complex</class>
    <class kind="struct">sopt::is_complex&lt; std::complex&lt; T &gt;, void &gt;</class>
    <namespace>sopt</namespace>
    <namespace>sopt::details</namespace>
    <member kind="typedef">
      <type>details::underlying_value_type&lt; T &gt;</type>
      <name>real_type</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7ee75936aaae93251b12abb77c3e02aa</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>relative_variation.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/relative__variation_8h.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <class kind="class">sopt::RelativeVariation</class>
    <class kind="class">sopt::ScalarRelativeVariation</class>
    <namespace>sopt</namespace>
  </compound>
  <compound kind="file">
    <name>reweighted.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/reweighted_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::Reweighted</class>
    <class kind="class">sopt::algorithm::Reweighted</class>
    <class kind="struct">sopt::algorithm::Reweighted::ReweightedResult</class>
    <class kind="class">sopt::algorithm::ImagingProximalADMM</class>
    <class kind="class">sopt::algorithm::PositiveQuadrant</class>
    <class kind="class">sopt::algorithm::PrimalDual</class>
    <class kind="class">sopt::algorithm::PositiveQuadrant</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="function">
      <type>Reweighted&lt; ALGORITHM &gt;</type>
      <name>reweighted</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a9d90a51f2ae69e07e802df6d21c6e384</anchor>
      <arglist>(ALGORITHM const &amp;algo, typename Reweighted&lt; ALGORITHM &gt;::t_SetWeights const &amp;set_weights, typename Reweighted&lt; ALGORITHM &gt;::t_Reweightee const &amp;reweightee)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::CwiseUnaryOp&lt; const details::ProjectPositiveQuadrant&lt; typename T::Scalar &gt;, const T &gt;</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>ad1377b8328b6fc78bd779dc9b852c9d7</anchor>
      <arglist>(Eigen::DenseBase&lt; T &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; PositiveQuadrant&lt; ImagingProximalADMM&lt; SCALAR &gt; &gt; &gt;</type>
      <name>reweighted</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a90f7859557f093f416e113d5acab1425</anchor>
      <arglist>(ImagingProximalADMM&lt; SCALAR &gt; const &amp;algo)</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; PositiveQuadrant&lt; PrimalDual&lt; SCALAR &gt; &gt; &gt;</type>
      <name>reweighted</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a6b5cd6e5186a8b6581991f357b60203b</anchor>
      <arglist>(PrimalDual&lt; SCALAR &gt; const &amp;algo)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>sampling.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/sampling_8cc.html</filename>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <namespace>sopt</namespace>
  </compound>
  <compound kind="file">
    <name>sampling.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/sampling_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::Sampling</class>
    <namespace>sopt</namespace>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a57b3045c6210eedfab02fd8faf71c18a</anchor>
      <arglist>(Sampling const &amp;sampling)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>sdmm.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/sdmm_8h.html</filename>
    <includes id="conjugate__gradient_8h" name="conjugate_gradient.h" local="yes" imported="no">sopt/conjugate_gradient.h</includes>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="proximal__expression_8h" name="proximal_expression.h" local="yes" imported="no">sopt/proximal_expression.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="wrapper_8h" name="wrapper.h" local="yes" imported="no">sopt/wrapper.h</includes>
    <class kind="class">sopt::algorithm::SDMM</class>
    <class kind="struct">sopt::algorithm::SDMM::Diagnostic</class>
    <class kind="struct">sopt::algorithm::SDMM::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>sdmm_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tf_g_proximal.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/tf__g__proximal_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="forward__backward_8h" name="forward_backward.h" local="yes" imported="no">sopt/forward_backward.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="g__proximal_8h" name="g_proximal.h" local="yes" imported="no">sopt/g_proximal.h</includes>
    <includes id="cppflow__utils_8h" name="cppflow_utils.h" local="yes" imported="no">sopt/cppflow_utils.h</includes>
    <class kind="class">sopt::algorithm::TFGProximal</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
  </compound>
  <compound kind="file">
    <name>tv_primal_dual.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/tv__primal__dual_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="primal__dual_8h" name="primal_dual.h" local="yes" imported="no">sopt/primal_dual.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::algorithm::TVPrimalDual</class>
    <class kind="struct">sopt::algorithm::TVPrimalDual::Diagnostic</class>
    <class kind="struct">sopt::algorithm::TVPrimalDual::DiagnosticAndResult</class>
    <namespace>sopt</namespace>
    <namespace>sopt::algorithm</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>tv__primal__dual_8h.html</anchorfile>
      <anchor>acc08c2e01b4beda3b86b0ad0e358476b</anchor>
      <arglist>(NAME, TYPE)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_MACRO</name>
      <anchorfile>tv__primal__dual_8h.html</anchorfile>
      <anchor>aad24c91e578b23e3517f2a44b2cd1d32</anchor>
      <arglist>(VAR, NAME, PROXIMAL)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>types.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/types_8h.html</filename>
    <includes id="real__type_8h" name="real_type.h" local="yes" imported="no">sopt/real_type.h</includes>
    <namespace>sopt</namespace>
    <member kind="typedef">
      <type>int</type>
      <name>t_int</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a47796df8f5f6bbffc226292ef1ca8196</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>size_t</type>
      <name>t_uint</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7237c0991f6ec8c2bbdab8929b564964</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>t_real</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a71bfb8f70b432862d3d654b9dcff77cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::complex&lt; t_real &gt;</type>
      <name>t_complex</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad24bc0cbf4f1391b3d1440213329d13f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Matrix&lt; T, Eigen::Dynamic, 1 &gt;</type>
      <name>Vector</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ac4dd3feebe1bf49ebd44d72b05064c19</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Matrix&lt; T, Eigen::Dynamic, Eigen::Dynamic &gt;</type>
      <name>Matrix</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>adedb6b3e862bd2968bf3026599121630</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Array&lt; T, Eigen::Dynamic, 1 &gt;</type>
      <name>Array</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a9de8d7c976f608fe47220203047b5cb8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Array&lt; T, Eigen::Dynamic, Eigen::Dynamic &gt;</type>
      <name>Image</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7d7971e5566e597eb907614917e30c78</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(VECTOR &amp;, VECTOR const &amp;)&gt;</type>
      <name>OperatorFunction</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aa4353f012100677172534381f2801fa9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(Vector&lt; SCALAR &gt; &amp;, typename real_type&lt; SCALAR &gt;::type, Vector&lt; SCALAR &gt; const &amp;)&gt;</type>
      <name>ProximalFunction</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>af924da011a36e574306ab72f9f423834</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; bool(Vector&lt; SCALAR &gt; const &amp;)&gt;</type>
      <name>ConvergenceFunction</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>acc375c693a8c32c2a954d17a7773b7f8</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>utilities.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/utilities_8cc.html</filename>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::utilities</namespace>
    <member kind="function">
      <type>Image</type>
      <name>read_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a571717c98b97e19d3d47d8507bb32a8a</anchor>
      <arglist>(std::string const &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a18ac636e4a560294191b1066bc3599b4</anchor>
      <arglist>(Image&lt;&gt; const &amp;image, std::string const &amp;filename)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>direct.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/direct_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="wavelet__data_8h" name="wavelet_data.h" local="yes" imported="no">sopt/wavelets/wavelet_data.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
    <member kind="function">
      <type>std::enable_if&lt; T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a378f59ac3ce43c1f2e81fc6480efc8df</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; &amp;coeffs, Eigen::ArrayBase&lt; T1 &gt; const &amp;signal, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; not T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acfff953dbab406985efac546d60c5edc</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs_, Eigen::ArrayBase&lt; T1 &gt; const &amp;signal, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a3c43c452d5929aff9d653d27ac25a7d1</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;signal, t_uint levels, WaveletData const &amp;wavelet) -&gt; decltype(copy(signal))</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>indirect.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/indirect_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="innards_8impl_8h" name="innards.impl.h" local="yes" imported="no">sopt/wavelets/innards.impl.h</includes>
    <includes id="wavelet__data_8h" name="wavelet_data.h" local="yes" imported="no">sopt/wavelets/wavelet_data.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
    <member kind="function">
      <type>std::enable_if&lt; T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>indirect_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aeceb4851a94ee330e349d09b2c19e8dd</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs, Eigen::ArrayBase&lt; T1 &gt; &amp;signal, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; not T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>indirect_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a4f8c686a731306166b3bc0246f147cb4</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs_, Eigen::ArrayBase&lt; T1 &gt; const &amp;signal_, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>indirect_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a808c93ad7353dbae45321d9163d8541f</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs, t_uint levels, WaveletData const &amp;wavelet) -&gt; decltype(copy(coeffs))</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>innards.impl.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/innards_8impl_8h.html</filename>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
  </compound>
  <compound kind="file">
    <name>sara.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/sara_8h.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="wavelets_2wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets/wavelets.h</includes>
    <class kind="class">sopt::wavelets::SARA</class>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_WAVELET_ERROR_MACRO</name>
      <anchorfile>sara_8h.html</anchorfile>
      <anchor>af9c1e573d55258466f65cefebc126fd3</anchor>
      <arglist>(INPUT)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelet_data.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/wavelet__data_8cc.html</filename>
    <includes id="wavelet__data_8h" name="wavelet_data.h" local="yes" imported="no">sopt/wavelets/wavelet_data.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
    <member kind="function">
      <type>const WaveletData &amp;</type>
      <name>daubechies_data</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>af4b021fa0322242bb199585c12803a0e</anchor>
      <arglist>(t_uint)</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies1</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a4d4743b54ba49eb44d47c3d0793a674b</anchor>
      <arglist>({7.071067811865475244008443621048490392848359376884740365883398e-01, 7.071067811865475244008443621048490392848359376884740365883398e-01})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies2</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a5002592a2dd383b15ea52305a17fb5e1</anchor>
      <arglist>({4.829629131445341433748715998644486838169524195042022752011715e-01, 8.365163037378079055752937809168732034593703883484392934953414e-01, 2.241438680420133810259727622404003554678835181842717613871683e-01, -1.294095225512603811744494188120241641745344506599652569070016e-01})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies3</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a66be4d3ea7f402f02b943b83f9d703c4</anchor>
      <arglist>({3.326705529500826159985115891390056300129233992450683597084705e-01, 8.068915093110925764944936040887134905192973949948236181650920e-01, 4.598775021184915700951519421476167208081101774314923066433867e-01, -1.350110200102545886963899066993744805622198452237811919756862e-01, -8.544127388202666169281916918177331153619763898808662976351748e-02, 3.522629188570953660274066471551002932775838791743161039893406e-02})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies4</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a9363f72a1a22e2591c841af8b7f71716</anchor>
      <arglist>({2.303778133088965008632911830440708500016152482483092977910968e-01, 7.148465705529156470899219552739926037076084010993081758450110e-01, 6.308807679298589078817163383006152202032229226771951174057473e-01, -2.798376941685985421141374718007538541198732022449175284003358e-02, -1.870348117190930840795706727890814195845441743745800912057770e-01, 3.084138183556076362721936253495905017031482172003403341821219e-02, 3.288301166688519973540751354924438866454194113754971259727278e-02, -1.059740178506903210488320852402722918109996490637641983484974e-02})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies5</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a065624b1f6a4a1467a10aeb0d364026b</anchor>
      <arglist>({1.601023979741929144807237480204207336505441246250578327725699e-01, 6.038292697971896705401193065250621075074221631016986987969283e-01, 7.243085284377729277280712441022186407687562182320073725767335e-01, 1.384281459013207315053971463390246973141057911739561022694652e-01, -2.422948870663820318625713794746163619914908080626185983913726e-01, -3.224486958463837464847975506213492831356498416379847225434268e-02, 7.757149384004571352313048938860181980623099452012527983210146e-02, -6.241490212798274274190519112920192970763557165687607323417435e-03, -1.258075199908199946850973993177579294920459162609785020169232e-02, 3.335725285473771277998183415817355747636524742305315099706428e-03})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies6</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ae89c2e3569ac3218f56f5094b5235e68</anchor>
      <arglist>({1.115407433501094636213239172409234390425395919844216759082360e-01, 4.946238903984530856772041768778555886377863828962743623531834e-01, 7.511339080210953506789344984397316855802547833382612009730420e-01, 3.152503517091976290859896548109263966495199235172945244404163e-01, -2.262646939654398200763145006609034656705401539728969940143487e-01, -1.297668675672619355622896058765854608452337492235814701599310e-01, 9.750160558732304910234355253812534233983074749525514279893193e-02, 2.752286553030572862554083950419321365738758783043454321494202e-02, -3.158203931748602956507908069984866905747953237314842337511464e-02, 5.538422011614961392519183980465012206110262773864964295476524e-04, 4.777257510945510639635975246820707050230501216581434297593254e-03, -1.077301085308479564852621609587200035235233609334419689818580e-03})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies7</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a49702bd7d22aceaaf286facf7bf264e5</anchor>
      <arglist>({7.785205408500917901996352195789374837918305292795568438702937e-02, 3.965393194819173065390003909368428563587151149333287401110499e-01, 7.291320908462351199169430703392820517179660611901363782697715e-01, 4.697822874051931224715911609744517386817913056787359532392529e-01, -1.439060039285649754050683622130460017952735705499084834401753e-01, -2.240361849938749826381404202332509644757830896773246552665095e-01, 7.130921926683026475087657050112904822711327451412314659575113e-02, 8.061260915108307191292248035938190585823820965629489058139218e-02, -3.802993693501441357959206160185803585446196938467869898283122e-02, -1.657454163066688065410767489170265479204504394820713705239272e-02, 1.255099855609984061298988603418777957289474046048710038411818e-02, 4.295779729213665211321291228197322228235350396942409742946366e-04, -1.801640704047490915268262912739550962585651469641090625323864e-03, 3.537137999745202484462958363064254310959060059520040012524275e-04})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies8</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ad5b012ac414bf584f93a967604fe64f8</anchor>
      <arglist>({5.441584224310400995500940520299935503599554294733050397729280e-02, 3.128715909142999706591623755057177219497319740370229185698712e-01, 6.756307362972898068078007670471831499869115906336364227766759e-01, 5.853546836542067127712655200450981944303266678053369055707175e-01, -1.582910525634930566738054787646630415774471154502826559735335e-02, -2.840155429615469265162031323741647324684350124871451793599204e-01, 4.724845739132827703605900098258949861948011288770074644084096e-04, 1.287474266204784588570292875097083843022601575556488795577000e-01, -1.736930100180754616961614886809598311413086529488394316977315e-02, -4.408825393079475150676372323896350189751839190110996472750391e-02, 1.398102791739828164872293057263345144239559532934347169146368e-02, 8.746094047405776716382743246475640180402147081140676742686747e-03, -4.870352993451574310422181557109824016634978512157003764736208e-03, -3.917403733769470462980803573237762675229350073890493724492694e-04, 6.754494064505693663695475738792991218489630013558432103617077e-04, -1.174767841247695337306282316988909444086693950311503927620013e-04})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies9</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa97d9eedea667446d99dff6e97781729</anchor>
      <arglist>({3.807794736387834658869765887955118448771714496278417476647192e-02, 2.438346746125903537320415816492844155263611085609231361429088e-01, 6.048231236901111119030768674342361708959562711896117565333713e-01, 6.572880780513005380782126390451732140305858669245918854436034e-01, 1.331973858250075761909549458997955536921780768433661136154346e-01, -2.932737832791749088064031952421987310438961628589906825725112e-01, -9.684078322297646051350813353769660224825458104599099679471267e-02, 1.485407493381063801350727175060423024791258577280603060771649e-01, 3.072568147933337921231740072037882714105805024670744781503060e-02, -6.763282906132997367564227482971901592578790871353739900748331e-02, 2.509471148314519575871897499885543315176271993709633321834164e-04, 2.236166212367909720537378270269095241855646688308853754721816e-02, -4.723204757751397277925707848242465405729514912627938018758526e-03, -4.281503682463429834496795002314531876481181811463288374860455e-03, 1.847646883056226476619129491125677051121081359600318160732515e-03, 2.303857635231959672052163928245421692940662052463711972260006e-04, -2.519631889427101369749886842878606607282181543478028214134265e-04, 3.934732031627159948068988306589150707782477055517013507359938e-05})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies10</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ad672cb3f1a5b61249f47526b9e7ddffc</anchor>
      <arglist>({2.667005790055555358661744877130858277192498290851289932779975e-02, 1.881768000776914890208929736790939942702546758640393484348595e-01, 5.272011889317255864817448279595081924981402680840223445318549e-01, 6.884590394536035657418717825492358539771364042407339537279681e-01, 2.811723436605774607487269984455892876243888859026150413831543e-01, -2.498464243273153794161018979207791000564669737132073715013121e-01, -1.959462743773770435042992543190981318766776476382778474396781e-01, 1.273693403357932600826772332014009770786177480422245995563097e-01, 9.305736460357235116035228983545273226942917998946925868063974e-02, -7.139414716639708714533609307605064767292611983702150917523756e-02, -2.945753682187581285828323760141839199388200516064948779769654e-02, 3.321267405934100173976365318215912897978337413267096043323351e-02, 3.606553566956169655423291417133403299517350518618994762730612e-03, -1.073317548333057504431811410651364448111548781143923213370333e-02, 1.395351747052901165789318447957707567660542855688552426721117e-03, 1.992405295185056117158742242640643211762555365514105280067936e-03, -6.858566949597116265613709819265714196625043336786920516211903e-04, -1.164668551292854509514809710258991891527461854347597362819235e-04, 9.358867032006959133405013034222854399688456215297276443521873e-05, -1.326420289452124481243667531226683305749240960605829756400674e-05})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies11</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acd532afe928ff0db33723de2908ed2bc</anchor>
      <arglist>({1.869429776147108402543572939561975728967774455921958543286692e-02, 1.440670211506245127951915849361001143023718967556239604318852e-01, 4.498997643560453347688940373853603677806895378648933474599655e-01, 6.856867749162005111209386316963097935940204964567703495051589e-01, 4.119643689479074629259396485710667307430400410187845315697242e-01, -1.622752450274903622405827269985511540744264324212130209649667e-01, -2.742308468179469612021009452835266628648089521775178221905778e-01, 6.604358819668319190061457888126302656753142168940791541113457e-02, 1.498120124663784964066562617044193298588272420267484653796909e-01, -4.647995511668418727161722589023744577223260966848260747450320e-02, -6.643878569502520527899215536971203191819566896079739622858574e-02, 3.133509021904607603094798408303144536358105680880031964936445e-02, 2.084090436018106302294811255656491015157761832734715691126692e-02, -1.536482090620159942619811609958822744014326495773000120205848e-02, -3.340858873014445606090808617982406101930658359499190845656731e-03, 4.928417656059041123170739741708273690285547729915802418397458e-03, -3.085928588151431651754590726278953307180216605078488581921562e-04, -8.930232506662646133900824622648653989879519878620728793133358e-04, 2.491525235528234988712216872666801088221199302855425381971392e-04, 5.443907469936847167357856879576832191936678525600793978043688e-05, -3.463498418698499554128085159974043214506488048233458035943601e-05, 4.494274277236510095415648282310130916410497987383753460571741e-06})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies12</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a1cebeab9fc170856eeb61aa5699aad60</anchor>
      <arglist>({1.311225795722951750674609088893328065665510641931325007748280e-02, 1.095662728211851546057045050248905426075680503066774046383657e-01, 3.773551352142126570928212604879206149010941706057526334705839e-01, 6.571987225793070893027611286641169834250203289988412141394281e-01, 5.158864784278156087560326480543032700677693087036090056127647e-01, -4.476388565377462666762747311540166529284543631505924139071704e-02, -3.161784537527855368648029353478031098508839032547364389574203e-01, -2.377925725606972768399754609133225784553366558331741152482612e-02, 1.824786059275796798540436116189241710294771448096302698329011e-01, 5.359569674352150328276276729768332288862665184192705821636342e-03, -9.643212009650708202650320534322484127430880143045220514346402e-02, 1.084913025582218438089010237748152188661630567603334659322512e-02, 4.154627749508444073927094681906574864513532221388374861287078e-02, -1.221864906974828071998798266471567712982466093116558175344811e-02, -1.284082519830068329466034471894728496206109832314097633275225e-02, 6.711499008795509177767027068215672450648112185856456740379455e-03, 2.248607240995237599950865211267234018343199786146177099262010e-03, -2.179503618627760471598903379584171187840075291860571264980942e-03, 6.545128212509595566500430399327110729111770568897356630714552e-06, 3.886530628209314435897288837795981791917488573420177523436096e-04, -8.850410920820432420821645961553726598738322151471932808015443e-05, -2.424154575703078402978915320531719580423778362664282239377532e-05, 1.277695221937976658714046362616620887375960941439428756055353e-05, -1.529071758068510902712239164522901223197615439660340672602696e-06})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies13</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a49147165dff3f7a6d01785be58b8face</anchor>
      <arglist>({9.202133538962367972970163475644184667534171916416562386009703e-03, 8.286124387290277964432027131230466405208113332890135072514277e-02, 3.119963221604380633960784112214049693946683528967180317160390e-01, 6.110558511587876528211995136744180562073612676018239438526582e-01, 5.888895704312189080710395347395333927665986382812836042235573e-01, 8.698572617964723731023739838087494399231884076619701250882016e-02, -3.149729077113886329981698255932282582876888450678789025950306e-01, -1.245767307508152589413808336021260180792739295173634719572069e-01, 1.794760794293398432348450072339369013581966256244133393042881e-01, 7.294893365677716380902830610477661983325929026879873553627963e-02, -1.058076181879343264509667304196464849478860754801236658232360e-01, -2.648840647534369463963912248034785726419604844297697016264224e-02, 5.613947710028342886214501998387331119988378792543100244737056e-02, 2.379972254059078811465170958554208358094394612051934868475139e-03, -2.383142071032364903206403067757739134252922717636226274077298e-02, 3.923941448797416243316370220815526558824746623451404043918407e-03, 7.255589401617566194518393300502698898973529679646683695269828e-03, -2.761911234656862178014576266098445995350093330501818024966316e-03, -1.315673911892298936613835370593643376060412592653652307238124e-03, 9.323261308672633862226517802548514100918088299801952307991569e-04, 4.925152512628946192140957387866596210103778299388823500840094e-05, -1.651289885565054894616687709238000755898548214659776703347801e-04, 3.067853757932549346649483228575476236600428217237900563128230e-05, 1.044193057140813708170714991080596951670706436217328169641474e-05, -4.700416479360868325650195165061771321650383582970958556568059e-06, 5.220035098454864691736424354843176976747052155243557001531901e-07})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies14</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a813fedb44ae17519e3e21754f213e43a</anchor>
      <arglist>({6.461153460087947818166397448622814272327159419201199218101404e-03, 6.236475884939889832798566758434877428305333693407667164602518e-02, 2.548502677926213536659077886778286686187042416367137443780084e-01, 5.543056179408938359926831449851154844078269830951634609683997e-01, 6.311878491048567795576617135358172348623952456570017289788809e-01, 2.186706877589065214917475918217517051765774321270432059030273e-01, -2.716885522787480414142192476181171094604882465683330814311896e-01, -2.180335299932760447555558812702311911975240669470604752747127e-01, 1.383952138648065910739939690021573713989900463229686119059119e-01, 1.399890165844607012492943162271163440328221555614326181333683e-01, -8.674841156816968904560822066727795382979149539517503657492964e-02, -7.154895550404613073584145115173807990958069673129538099990913e-02, 5.523712625921604411618834060533403397913833632511672157671107e-02, 2.698140830791291697399031403215193343375766595807274233284349e-02, -3.018535154039063518714822623489137573781575406658652624883756e-02, -5.615049530356959133218371367691498637457297203925810387698680e-03, 1.278949326633340896157330705784079299374903861572058313481534e-02, -7.462189892683849371817160739181780971958187988813302900435487e-04, -3.849638868022187445786349316095551774096818508285700493058915e-03, 1.061691085606761843032566749388411173033941582147830863893939e-03, 7.080211542355278586442977697617128983471863464181595371670094e-04, -3.868319473129544821076663398057314427328902107842165379901468e-04, -4.177724577037259735267979539839258928389726590132730131054323e-05, 6.875504252697509603873437021628031601890370687651875279882727e-05, -1.033720918457077394661407342594814586269272509490744850691443e-05, -4.389704901781394115254042561367169829323085360800825718151049e-06, 1.724994675367812769885712692741798523587894709867356576910717e-06, -1.787139968311359076334192938470839343882990309976959446994022e-07})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies15</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a6681b4c96d6054bff40539df33b72b86</anchor>
      <arglist>({4.538537361578898881459394910211696346663671243788786997916513e-03, 4.674339489276627189170969334843575776579151700214943513113197e-02, 2.060238639869957315398915009476307219306138505641930902702047e-01, 4.926317717081396236067757074029946372617221565130932402160160e-01, 6.458131403574243581764209120106917996432608287494046181071489e-01, 3.390025354547315276912641143835773918756769491793554669336690e-01, -1.932041396091454287063990534321471746304090039142863827937754e-01, -2.888825965669656462484125009822332981311435630435342594971292e-01, 6.528295284877281692283107919869574882039174285596144125965101e-02, 1.901467140071229823484893116586020517959501258174336696878156e-01, -3.966617655579094448384366751896200668381742820683736805449745e-02, -1.111209360372316933656710324674058608858623762165914120505657e-01, 3.387714392350768620854817844433523770864744687411265369463195e-02, 5.478055058450761268913790312581879108609415997422768564244845e-02, -2.576700732843996258594525754269826392203641634825340138396836e-02, -2.081005016969308167788483424677000162054657951364899040996166e-02, 1.508391802783590236329274460170322736244892823305627716233968e-02, 5.101000360407543169708860185565314724801066527344222055526631e-03, -6.487734560315744995181683149218690816955845639388826407928967e-03, -2.417564907616242811667225326300179605229946995814535223329411e-04, 1.943323980382211541764912332541087441011424865579531401452302e-03, -3.734823541376169920098094213645414611387630968030256625740226e-04, -3.595652443624688121649620075909808858194202454084090305627480e-04, 1.558964899205997479471658241227108816255567059625495915228603e-04, 2.579269915531893680925862417616855912944042368767340709160119e-05, -2.813329626604781364755324777078478665791443876293788904267255e-05, 3.362987181737579803124845210420177472134846655864078187186304e-06, 1.811270407940577083768510912285841160577085925337507850590290e-06, -6.316882325881664421201597299517657654166137915121195510416641e-07, 6.133359913305752029056299460289788601989190450885396512173845e-08})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies16</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a66cb1ad7be03f54ede0122d376d55356</anchor>
      <arglist>({3.189220925347738029769547564645958687067086750131428767875878e-03, 3.490771432367334641030147224023020009218241430503984146140054e-02, 1.650642834888531178991252730561134811584835002342723240213592e-01, 4.303127228460038137403925424357684620633970478036986773924646e-01, 6.373563320837888986319852412996030536498595940814198125967751e-01, 4.402902568863569000390869163571679288527803035135272578789884e-01, -8.975108940248964285718718077442597430659247445582660149624718e-02, -3.270633105279177046462905675689119641757228918228812428141723e-01, -2.791820813302827668264519595026873204339971219174736041535479e-02, 2.111906939471042887209680163268837900928491426167679439251042e-01, 2.734026375271604136485245757201617965429027819507130220231500e-02, -1.323883055638103904500474147756493375092287817706027978798549e-01, -6.239722752474871765674503394120025865444656311678760990761458e-03, 7.592423604427631582148498743941422461530405946100943351940313e-02, -7.588974368857737638494890864636995796586975144990925400097160e-03, -3.688839769173014233352666320894554314718748429706730831064068e-02, 1.029765964095596941165000580076616900528856265803662208854147e-02, 1.399376885982873102950451873670329726409840291727868988490100e-02, -6.990014563413916670284249536517288338057856199646469078115759e-03, -3.644279621498389932169000540933629387055333973353108668841215e-03, 3.128023381206268831661202559854678767821471906193608117450360e-03, 4.078969808497128362417470323406095782431952972310546715071397e-04, -9.410217493595675889266453953635875407754747216734480509250273e-04, 1.142415200387223926440228099555662945839684344936472652877091e-04, 1.747872452253381803801758637660746874986024728615399897971953e-04, -6.103596621410935835162369150522212811957259981965919143961722e-05, -1.394566898820889345199078311998401982325273569198675335408707e-05, 1.133660866127625858758848762886536997519471068203753661757843e-05, -1.043571342311606501525454737262615404887478930635676471546032e-06, -7.363656785451205512099695719725563646585445545841663327433569e-07, 2.308784086857545866405412732942006121306306735866655525372544e-07, -2.109339630100743097000572623603489906836297584591605307745349e-08})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies17</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a36fbf51bae105b8f6d10c88c5a9cbe6d</anchor>
      <arglist>({2.241807001037312853535962677074436914062191880560370733250531e-03, 2.598539370360604338914864591720788315473944524878241294399948e-02, 1.312149033078244065775506231859069960144293609259978530067004e-01, 3.703507241526411504492548190721886449477078876896803823650425e-01, 6.109966156846228181886678867679372082737093893358726291371783e-01, 5.183157640569378393254538528085968046216817197718416402439904e-01, 2.731497040329363500431250719147586480350469818964563003672942e-02, -3.283207483639617360909665340725061767581597698151558024679130e-01, -1.265997522158827028744679110933825505053966260104086162103728e-01, 1.973105895650109927854047044781930142551422414135646917122284e-01, 1.011354891774702721509699856433434802196622545499664876109437e-01, -1.268156917782863110948571128662331680384792185915017065732137e-01, -5.709141963167692728911239478651382324161160869845347053990144e-02, 8.110598665416088507965885748555429201024364190954499194020678e-02, 2.231233617810379595339136059534813756232242114093689244020869e-02, -4.692243838926973733300897059211400507138768125498030602878439e-02, -3.270955535819293781655360222177494452069525958061609392809275e-03, 2.273367658394627031845616244788448969906713741338339498024864e-02, -3.042989981354637068592482637907206078633395457225096588287881e-03, -8.602921520322854831713706413243659917926736284271730611920986e-03, 2.967996691526094872806485060008038269959463846548378995044195e-03, 2.301205242153545624302059869038423604241976680189447476064764e-03, -1.436845304802976126222890402980384903503674530729935809561434e-03, -3.281325194098379713954444017520115075812402442728749700195651e-04, 4.394654277686436778385677527317841632289249319738892179465910e-04, -2.561010956654845882729891210949920221664082061531909655178413e-05, -8.204803202453391839095482576282189866136273049636764338689593e-05, 2.318681379874595084482068205706277572106695174091895338530734e-05, 6.990600985076751273204549700855378627762758585902057964027481e-06, -4.505942477222988194102268206378312129713572600716499944918416e-06, 3.016549609994557415605207594879939763476168705217646897702706e-07, 2.957700933316856754979905258816151367870345628924317307354639e-07, -8.423948446002680178787071296922877068410310942222799622593133e-08, 7.267492968561608110879767441409035034158581719789791088892046e-09})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies18</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa39515c6c808b7ec7170e69148364209</anchor>
      <arglist>({1.576310218440760431540744929939777747670753710991660363684429e-03, 1.928853172414637705921391715829052419954667025288497572236714e-02, 1.035884658224235962241910491937253596470696555220241672976224e-01, 3.146789413370316990571998255652579931786706190489374509491307e-01, 5.718268077666072234818589370900623419393673743130930561295324e-01, 5.718016548886513352891119994065965025668047882818525060759395e-01, 1.472231119699281415750977271081072312557864107355701387801677e-01, -2.936540407365587442479030994981150723935710729035053239661752e-01, -2.164809340051429711237678625668271471437937235669492408388692e-01, 1.495339755653777893509301738913667208804816691893765610261943e-01, 1.670813127632574045149318139950134745324205646353988083152250e-01, -9.233188415084628060429372558659459731431848000144569612074508e-02, -1.067522466598284855932200581614984861385266404624112083917702e-01, 6.488721621190544281947577955141911463129382116634147846137149e-02, 5.705124773853688412090768846499622260596226120431038524600676e-02, -4.452614190298232471556143559744653492971477891439833592755034e-02, -2.373321039586000103275209582665216110197519330713490233071565e-02, 2.667070592647059029987908631672020343207895999936072813363471e-02, 6.262167954305707485236093144497882501990325204745013190268052e-03, -1.305148094661200177277636447600807169755191054507571666606133e-02, 1.186300338581174657301741592161819084544899417452317405185615e-04, 4.943343605466738130665529516802974834299638313366477765295203e-03, -1.118732666992497072800658855238650182318060482584970145512687e-03, -1.340596298336106629517567228251583609823044524685986640323942e-03, 6.284656829651457125619449885420838217551022796301582874349652e-04, 2.135815619103406884039052814341926025873200325996466522543440e-04, -1.986485523117479485798245416362489554927797880264017876139605e-04, -1.535917123534724675069770335876717193700472427021513236587288e-07, 3.741237880740038181092208138035393952304292615793985030731363e-05, -8.520602537446695203919254911655523022437596956226376512305917e-06, -3.332634478885821888782452033341036827311505907796498439829337e-06, 1.768712983627615455876328730755375176412501359114058815453100e-06, -7.691632689885176146000152878539598405817397588156525116769908e-08, -1.176098767028231698450982356561292561347579777695396953528141e-07, 3.068835863045174800935478294933975372450179787894574492930570e-08, -2.507934454948598267195173183147126731806317144868275819941403e-09})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies19</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a5632b88883c0693d1a196806cae948d6</anchor>
      <arglist>({1.108669763181710571099154195209715164245299677773435932135455e-03, 1.428109845076439737439889152950199234745663442163665957870715e-02, 8.127811326545955065296306784901624839844979971028620366497726e-02, 2.643884317408967846748100380289426873862377807211920718417385e-01, 5.244363774646549153360575975484064626044633641048072116393160e-01, 6.017045491275378948867077135921802620536565639585963293313931e-01, 2.608949526510388292872456675310528324172673101301907739925213e-01, -2.280913942154826463746325776054637207093787237086425909534822e-01, -2.858386317558262418545975695028984237217356095588335149922119e-01, 7.465226970810326636763433111878819005865866149731909656365399e-02, 2.123497433062784888090608567059824197077074200878839448416908e-01, -3.351854190230287868169388418785731506977845075238966819814032e-02, -1.427856950387365749779602731626112812998497706152428508627562e-01, 2.758435062562866875014743520162198655374474596963423080762818e-02, 8.690675555581223248847645428808443034785208002468192759640352e-02, -2.650123625012304089901835843676387361075068017686747808171345e-02, -4.567422627723090805645444214295796017938935732115630050880109e-02, 2.162376740958504713032984257172372354318097067858752542571020e-02, 1.937554988917612764637094354457999814496885095875825546406963e-02, -1.398838867853514163250401235248662521916813867453095836808366e-02, -5.866922281012174726584493436054373773814608340808758177372765e-03, 7.040747367105243153014511207400620109401689897665383078229398e-03, 7.689543592575483559749139148673955163477947086039406129546422e-04, -2.687551800701582003957363855070398636534038920982478290170267e-03, 3.418086534585957765651657290463808135214214848819517257794031e-04, 7.358025205054352070260481905397281875183175792779904858189494e-04, -2.606761356786280057318315130897522790383939362073563408613547e-04, -1.246007917341587753449784408901653990317341413341980904757592e-04, 8.711270467219922965416862388191128268412933893282083517729443e-05, 5.105950487073886053049222809934231573687367992106282669389264e-06, -1.664017629715494454620677719899198630333675608812018108739144e-05, 3.010964316296526339695334454725943632645798938162427168851382e-06, 1.531931476691193063931832381086636031203123032723477463624141e-06, -6.862755657769142701883554613486732854452740752771392411758418e-07, 1.447088298797844542078219863291615420551673574071367834316167e-08, 4.636937775782604223430857728210948898871748291085962296649320e-08, -1.116402067035825816390504769142472586464975799284473682246076e-08, 8.666848838997619350323013540782124627289742190273059319122840e-10})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies20</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ad27ad97784ced5e128aa54f5b8dbf6d8</anchor>
      <arglist>({7.799536136668463215861994818889370970510722039232863880031127e-04, 1.054939462495039832454480973015641498231961468733236691299796e-02, 6.342378045908151497587346582668785136406523315729666353643372e-02, 2.199421135513970450080335972537209392121306761010882209298252e-01, 4.726961853109016963710241465101446230757804141171727845834637e-01, 6.104932389385938201631515660084201906858628924695448898824748e-01, 3.615022987393310629195602665268631744967084723079677894136358e-01, -1.392120880114838725806970545155530518264944915437808314813582e-01, -3.267868004340349674031122837905370666716645587480021744425550e-01, -1.672708830907700757517174997304297054003744303620479394006890e-02, 2.282910508199163229728429126648223086437547237250290835639880e-01, 3.985024645777120219790581076522174181104027576954427684456660e-02, -1.554587507072679559315307870562464374359996091752285157077477e-01, -2.471682733861358401587992299169922262915151413349313513685587e-02, 1.022917191744425578861013681016866083888381385233081516583444e-01, 5.632246857307435506953246988215209861566800664402785938591145e-03, -6.172289962468045973318658334083283558209278762007041823250642e-02, 5.874681811811826491300679742081997167209743446956901841959711e-03, 3.229429953076958175885440860617219117564558605035979601073235e-02, -8.789324923901561348753650366700695916503030939283830968151332e-03, -1.381052613715192007819606423860356590496904285724730356602106e-02, 6.721627302259456835336850521405425560520025237915708362002910e-03, 4.420542387045790963058229526673514088808999478115581153468068e-03, -3.581494259609622777556169638358238375765194248623891034940330e-03, -8.315621728225569192482585199373230956924484221135739973390038e-04, 1.392559619323136323905254999347967283760544147397530531142397e-03, -5.349759843997695051759716377213680036185796059087353172073952e-05, -3.851047486992176060650288501475716463266233035937022303649838e-04, 1.015328897367029050797488785306056522529979267572003990901472e-04, 6.774280828377729558011184406727978221295796652200819839464354e-05, -3.710586183394712864227221271216408416958225264980612822617745e-05, -4.376143862183996810373095822528607606900620592585762190542483e-06, 7.241248287673620102843105877497181565468725757387007139555885e-06, -1.011994010018886150340475413756849103197395069431085005709201e-06, -6.847079597000556894163334787575159759109091330092963990364192e-07, 2.633924226270001084129057791994367121555769686616747162262697e-07, 2.014322023550512694324757845944026047904414136633776958392681e-10, -1.814843248299695973210605258227024081458531110762083371310917e-08, 4.056127055551832766099146230616888024627380574113178257963252e-09, -2.998836489619319566407767078372705385732460052685621923178375e-10})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies21</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa16c67f6867519547aaeef71fefc83ec</anchor>
      <arglist>({5.488225098526837086776336675992521426750673054588245523834775e-04, 7.776639052354783754338787398088799862510779059555623704879234e-03, 4.924777153817727491399853378340056968104483161598320693657954e-02, 1.813596254403815156260378722764624190931951510708050516519181e-01, 4.196879449393627730946850609089266339973601543036294871772653e-01, 6.015060949350038975629880664020955953066542593896126705346122e-01, 4.445904519276003403643290994523601016151342743089878478478962e-01, -3.572291961725529045922914178005307189036762547143966578066838e-02, -3.356640895305295094832978867114363069987575282256098351499731e-01, -1.123970715684509813515004981340306901641824212464197973490295e-01, 2.115645276808723923846781645238468659430862736248896128529373e-01, 1.152332984396871041993434411681730428103160016594558944687967e-01, -1.399404249325472249247758764839776903226503657502071670245304e-01, -8.177594298086382887387303634193790542522570670234556157566786e-02, 9.660039032372422070232189700372539681627783322249829842275517e-02, 4.572340574922879239251202944731235421034828710753381191345186e-02, -6.497750489373232063332311106008616685748929419452249544690967e-02, -1.865385920211851534093244412008141266131208093007217139232170e-02, 3.972683542785044175197464400756126818299918992482587866999707e-02, 3.357756390338110842532604766376200760791669954106679933144723e-03, -2.089205367797907948785235479746212371728219866525211135343707e-02, 2.403470920805434762380632169785689545910525667396313550679652e-03, 8.988824381971911875349463398395464114417817949738911101372312e-03, -2.891334348588901247375268718015882610844675931117463495551958e-03, -2.958374038932831280750770228215510959830170264176955719827510e-03, 1.716607040630624138494506282569230126333308533535502799235333e-03, 6.394185005120302146432543767052865436099994387647359452249347e-04, -6.906711170821016507268939228893784790518270744313525548714065e-04, -3.196406277680437193708834220804640347636984901270948088339102e-05, 1.936646504165080615323696689856004910579777568504218782029027e-04, -3.635520250086338309442855006186370752206331429871136596927137e-05, -3.499665984987447953974079490046597240276268044409625722689849e-05, 1.535482509276049283124233498646050472096482329299719141107128e-05, 2.790330539814487046106169582691767916283793946025922387556917e-06, -3.090017164545699197158555936852697325985864588418167982685400e-06, 3.166095442367030556603889009833954440058545355777781782000278e-07, 2.992136630464852794401294607536813682771292352506328096125857e-07, -1.000400879030597332045460600516621971679363965166249211063755e-07, -2.254014974673330131563184851456825991617915549643308754828159e-09, 7.058033541231121859020947976903904685464512825731230495144226e-09, -1.471954197650365265189549600816698778213247061389470277337173e-09, 1.038805571023706553035373138760372703492942617518816122570050e-10})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies22</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a6ed5cb3696cd40be0cbf6d6731bcaf4f</anchor>
      <arglist>({3.862632314910982158524358900615460368877852009576899680767316e-04, 5.721854631334539120809783403484493333555361591386208129183833e-03, 3.806993723641108494769873046391825574447727068953448390456335e-02, 1.483675408901114285014404448710249837385836373168215616427030e-01, 3.677286834460374788614690818452372827430535649696462720334897e-01, 5.784327310095244271421181831735444106385099957908657145590104e-01, 5.079010906221639018391523325390716836568713192498711562711282e-01, 7.372450118363015165570139016530653113725172412104955350368114e-02, -3.127265804282961918033226222621788537078452535993545440716988e-01, -2.005684061048870939324361244042200174132905844868237447130382e-01, 1.640931881067664818606223226286885712554385317412228836705888e-01, 1.799731879928913037252154295313083168387840791424988422757762e-01, -9.711079840911470969274209179691733251456735137994201552926799e-02, -1.317681376866834107513648518146838345477875022352088357523838e-01, 6.807631439273221556739202147004580559367442550641388181886023e-02, 8.455737636682607503362813659356786494357635805197410905877078e-02, -5.136425429744413245727949984018884707909441768477091944584584e-02, -4.653081182750671347875833607846979997825771277976548080904423e-02, 3.697084662069802057615318892988581825637896696876361343354380e-02, 2.058670762756536044060249710676656807281671451609632981487139e-02, -2.348000134449318868560142854519364987363882333754753819791381e-02, -6.213782849364658499069336123807608293122900450508440420104462e-03, 1.256472521834337406887017835495604463815382993214296088172221e-02, 3.001373985076435951229129255588255746904937042979316054485183e-04, -5.455691986156717076595353163071679107868762395367234726592273e-03, 1.044260739186025323350755659184734060807432172611689413745029e-03, 1.827010495657279080112597436850157110235336772062961041154607e-03, -7.706909881231196232880372722955519781655769913634565757339739e-04, -4.237873998391800799531947768003976978197438302533528661825758e-04, 3.286094142136787341983758471405935405823323072829619248523697e-04, 4.345899904532003379046992625575076092823809665933575578710696e-05, -9.405223634815760421845190098352673647881298980040512091599943e-05, 1.137434966212593172736144274866639210339820203135670505287250e-05, 1.737375695756189356163565074505405906859746605867772002320509e-05, -6.166729316467578372152251668422979152169587307212708981768966e-06, -1.565179131995160159307426993578204733378112742579926503832095e-06, 1.295182057318877573889711232345068147800395721925682566394936e-06, -8.779879873361286276888117046153049053917243760475816789226764e-08, -1.283336228751754417819693932114064887075096030264748079976736e-07, 3.761228749337362366156711648187743399164239397803629022612862e-08, 1.680171404922988885554331183691280245962290247654438114807112e-09, -2.729623146632976083449327361739104754443221903317745768938846e-09, 5.335938821667489905169783227036804533253011117886586305435615e-10, -3.602113484339554703794807810939301847299106970237814334104274e-11})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies23</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ab8fe7671f0819ad697a089109032ff96</anchor>
      <arglist>({2.719041941282888414192673609703302357098336003920923958924757e-04, 4.202748893183833538390034372523511472345215563611003407984701e-03, 2.931000365788411514736204018929480427874317460676079959515131e-02, 1.205155317839719336306053895611899089004274336891709067958035e-01, 3.184508138528652363416527748460472152790575031409830417259640e-01, 5.449311478735204282674240672421984387504149924834544495466793e-01, 5.510185172419193913452724227212507720514144116478727269717859e-01, 1.813926253638400136259098302138614937264260737638175539416540e-01, -2.613921480306441118856795735210118413900307577511142987337375e-01, -2.714020986078430556604069575184718123763697177381058877113471e-01, 9.212540708241805260646030910734894258577648089100630012130261e-02, 2.235736582420402317149513960822561717689875252792817094811874e-01, -3.303744709428937875006612792463031409461636228731285046551636e-02, -1.640113215318759250156057837165276039181451149292112929401186e-01, 2.028307457564929974897286607551313323418860610791382310375731e-02, 1.122970436181072886950734465075645977754665593869789965874572e-01, -2.112621235622724100704783293549467048999443844657058425212982e-02, -7.020739157490110946204219011957565343899895499962369353294028e-02, 2.176585683449997560776882472168730165799461445156766923497545e-02, 3.849533252256919901057154320407596073180564628069920893870768e-02, -1.852351365015615979794689960740674782817814176166333519597796e-02, -1.753710100303584537915846117408613551147985251726558719415169e-02, 1.275194393152828646243157404474947115052750581861997731041018e-02, 6.031840650024162816289878206037841640814102314209075233751820e-03, -7.075319273706152814194039481466556204493276773483821748740018e-03, -1.134865473356251691289337120013286756337393784110786907825400e-03, 3.122876449818144997419144765125750522437659393621577492535411e-03, -2.465014005163512031940473100375377210862560761576109755841161e-04, -1.061231228886651321139357625683805642193648671030425010215075e-03, 3.194204927099011503676530359692366990929679170022583007683112e-04, 2.567624520078737205563856675376636092314813400664190770435450e-04, -1.500218503490340967673163290447832236259277810659068637402668e-04, -3.378894834120903434270962452674534330903724108906662510305045e-05, 4.426071203109246077621875303440935335701832843654692827539837e-05, -2.635207889249186237209225933170897825432335273771458456888097e-06, -8.347875567854625544366043748844183086765894974439245409223337e-06, 2.397569546840240057403739507525641239509517148980849889986407e-06, 8.147574834779447778085443041422881439860288287528356019216814e-07, -5.339005405209421154584783682848780965053642859373536945701365e-07, 1.853091785633965019353699857864654181728710556702529908304185e-08, 5.417549179539278736503176166323685597634496102979977037271945e-08, -1.399935495437998845130909687361847103274208993447892120341999e-08, -9.472885901812050535221582074673490573092096712822067564903012e-10, 1.050446453696543404071105111096438573423068913105255997908040e-09, -1.932405111313417542192651899622541612314066389643607507706887e-10, 1.250203302351040941433216718217504240541423430995137507404787e-11})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies24</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aac29c3b28887ea10c40db90a28c4517a</anchor>
      <arglist>({1.914358009475513695026138336474115599435172088053846745168462e-04, 3.082081714905494436206199424544404720984720556128685270556458e-03, 2.248233994971641072358415157184825628226776692231940577581580e-02, 9.726223583362519663806545734008355914527504417674578571164300e-02, 2.729089160677263268706137134412557268751671263458895098625356e-01, 5.043710408399249919771876890402814109246866444441814540282099e-01, 5.749392210955419968460807901923407033144945935105622912839838e-01, 2.809855532337118833442626085115402941842959475929278883281409e-01, -1.872714068851562376981887159775791469060265778441667840307934e-01, -3.179430789993627375453948489797707550898087789160025182664299e-01, 4.776613684344728187950198323031360866349104994035553200788631e-03, 2.392373887803108551973268291945824822214858134512317715815616e-01, 4.252872964148383258147364472170645232684343235486951540533893e-02, -1.711753513703468896897638515080572393949165942335556397917666e-01, -3.877717357792001620177594726199572688446488033750771020190283e-02, 1.210163034692242362312637311149062286659377039046006801523826e-01, 2.098011370914481534980883827326017063121637262728447783605518e-02, -8.216165420800166702291466006164189460916816748629968198028898e-02, -4.578436241819221637997516339765068825260159169893967894877272e-03, 5.130162003998087915555334881398688958843078494595140394873884e-02, -4.944709428125628299815920032649550811877887219282751174798211e-03, -2.821310709490189098113895361900699228886900995412759197674058e-02, 7.661721881646585897329899904308764405384658404613669817843430e-03, 1.304997087108573583052494067883717533043101857128653233783396e-02, -6.291435370018187780721843581169343900864298634085743861509767e-03, -4.746568786323113800477796959513558401732252800905982385017245e-03, 3.736046178282523345179052160810332868725126356493155728625572e-03, 1.153764936839481504858282495202271984454410046682805375157566e-03, -1.696456818974824394274534636412116243080312601322325642741589e-03, -4.416184856141520063365958900079406737636243682138363561877750e-05, 5.861270593183109933716735450272894035425792347806515678695765e-04, -1.181233237969554740613021227756568966806892308457221016257961e-04, -1.460079817762616838924301818082729036314539476811023255670666e-04, 6.559388639305634085303738560455061974369354538271316071502698e-05, 2.183241460466558363365044032984257709791187640963509380549307e-05, -2.022888292612697682860859987200455702614855595412267510558659e-05, 1.341157750809114719319937553186023660581084151828593222893663e-08, 3.901100338597702610409014129024223853127911530009766793352492e-06, -8.980253143938407724149926669980791166378388013293887718404796e-07, -4.032507756879971624098983247358983425236092110387724315244646e-07, 2.166339653278574639176393978510246335478946697396400359281412e-07, -5.057645419792500308492508924343248979317507866520688417567606e-10, -2.255740388176086107368821674947175804005323153443170526520277e-08, 5.157776789671999638950774266313208715015419699643333784626363e-09, 4.748375824256231118094453549799175824526559994333227456737433e-10, -4.024658644584379774251499574468195118601698713554294941756559e-10, 6.991801157638230974132696433509625934021677793453732225542951e-11, -4.342782503803710247259037552886749457951053124203814185811297e-12})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies25</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a765bf43c5fcb3d2245f1b5c530dcbc8d</anchor>
      <arglist>({1.348029793470188994578489247159356055370460656508881471268611e-04, 2.256959591854779520121391049628056149270016860666661928130747e-03, 1.718674125404015533817186914954848902241194002444696221013131e-02, 7.803586287213267559750659320481403668422052199257139168386084e-02, 2.316935078860218199900621518057089104946216881512075361624214e-01, 4.596834151460945937896973864539659944010260858049947396093277e-01, 5.816368967460577833534892038757085635755639698734580573323031e-01, 3.678850748029466984371319740855532278670733841012809062966976e-01, -9.717464096463814276130048169040892607068486428294030952842447e-02, -3.364730796417461309562110148848845218930261030262170601615289e-01, -8.758761458765466140226687673880006154266689569025041229545538e-02, 2.245378197451017129525176510409543155930843160711989062118482e-01, 1.181552867199598604563067876819931882639429216001523151773895e-01, -1.505602137505796309518094206831433270850173484773520730186277e-01, -9.850861528996022153725952822686729410420350758543226219234795e-02, 1.066338050184779528831274540522414711301747903916268438037723e-01, 6.675216449401860666895983072443984697329752470942906490126865e-02, -7.708411105657419356208567671699032054872853174701595359329826e-02, -3.717396286112250887598137324046870459877639250821705817221557e-02, 5.361790939877949960629041419546536897037332284703545849594129e-02, 1.554260592910229163981295854603203625062268043511894295387375e-02, -3.404232046065334099320628584033729153497903561399447916116575e-02, -3.079836794847036661636693963570288706232460663070983852354326e-03, 1.892280447662762841086581178691039363674755753459524525886478e-02, -1.989425782202736494289461896386235348901617760816745484282494e-03, -8.860702618046368399013064252456556969199612331833605310278698e-03, 2.726936258738495739871469244610042793734119359765762028996059e-03, 3.322707773973191780118197357194829286271392998979276105842863e-03, -1.842484290203331280837780430014195744813667655929909114672154e-03, -8.999774237462950491085382524008429604309720852269895692000702e-04, 8.772581936748274843488806190175921376284150686011179612908221e-04, 1.153212440466300456460181455345639872216326644527860903202733e-04, -3.098800990984697989530544245356271119416614147098459162436317e-04, 3.543714523276059005284289830559259809540337561365927850248007e-05, 7.904640003965528255137496303166001735463107762646364003487560e-05, -2.733048119960041746353244004225286857636045649642652816856524e-05, -1.277195293199783804144903848434605690990373526086311486716394e-05, 8.990661393062588905369930197413951232059323587543226269327396e-06, 5.232827708153076417963912065899772684403904504491727061662335e-07, -1.779201332653634562565948556039009149458987774189389221295909e-06, 3.212037518862519094895005816661093988294166712919881121802831e-07, 1.922806790142371601278104244711267420759978799176017569693322e-07, -8.656941732278507163388031517930974947984281611717187862530250e-08, -2.611598556111770864259843089151782206922842627174274274741722e-09, 9.279224480081372372250073354726511359667401736947170444723772e-09, -1.880415755062155537197782595740975189878162661203102565611681e-09, -2.228474910228168899314793352064795957306403503495743572518755e-10, 1.535901570162657197021927739530721955859277615795931442682785e-10, -2.527625163465644811048864286169758128142169484216932624854015e-11, 1.509692082823910867903367712096001664979004526477422347957324e-12})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies26</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>adf4f6bf1d5460099e7c81552f77aa23a</anchor>
      <arglist>({9.493795750710592117802731381148054398461637804818126397577999e-05, 1.650520233532988247022384885622071050555268137055829216839523e-03, 1.309755429255850082057770240106799154079932963479202407364818e-02, 6.227474402514960484193581705107415937690538641013309745983962e-02, 1.950394387167700994245891508369324694703820522489789125908612e-01, 4.132929622783563686116108686666547082846741228042232731476147e-01, 5.736690430342222603195557147853022060758392664086633396520345e-01, 4.391583117891662321931477565794105633815363384084590559889493e-01, 1.774076780986685727823533562031556893226571319881417676492595e-03, -3.263845936917800216385340830055349953447745005769416287177497e-01, -1.748399612893925042664835683606584215248582345438816346170042e-01, 1.812918323111226960705459766025430918716233584167982942044424e-01, 1.827554095896723746537533832033286839689931924709760567945595e-01, -1.043239002859270439148009137202747658420968144330108510179290e-01, -1.479771932752544935782314546369458188243947772922980064071205e-01, 6.982318611329236513756591683950208955110603212379412334701145e-02, 1.064824052498086303236593797715344405836015002929319291715777e-01, -5.344856168148319149493577269390074213960237013099439431132086e-02, -6.865475960403591525454725258715351280947435823354011140858001e-02, 4.223218579637203541206570902753288247790857760067894456114927e-02, 3.853571597111186425832144567362328142994885395255438867968781e-02, -3.137811036306775484244644776337594435094096964336402798072360e-02, -1.776090356835818354094298625884058170354129044259951019182732e-02, 2.073492017996382475887790073068984224515077665517103399898854e-02, 5.829580555318887971939315747596613038479561943085291072787359e-03, -1.178549790619302893728624468402138072504226527540325463847390e-02, -5.287383992626814439198630765217969804966319971038003993984480e-04, 5.601947239423804853206514239940474788977188460452053462770324e-03, -9.390582504738289646165698675070641765810790863514339205205998e-04, -2.145530281567620980305401403432221668847980295600748913748902e-03, 8.383488056543616046381924054554052104937784379435436426690560e-04, 6.161382204574344193703789012696411561214682388271673214197731e-04, -4.319557074261807466712901913481943478521991611607433971794602e-04, -1.060574748283803889966150803551837402553866816191659959347053e-04, 1.574795238607493590547765666590811258087715699737771458390360e-04, -5.277795493037868976293566636015627609248847457646525246271036e-06, -4.109673996391477816326502438997466532822639385119090230965252e-05, 1.074221540872195031273584409245060623104931330938273936484593e-05, 7.000078682964986734859102495210684809643657474253921074934684e-06, -3.887400161856795187587790410706550576033603097954065074023128e-06, -4.650463220640262639231145944536092973446596027469833860001618e-07, 7.939210633709952088373459255067360793370284788682979065122810e-07, -1.079004237578671411922961583845716126060658213943840375162654e-07, -8.904466370168590769052983362721567202750591914741016835071257e-08, 3.407795621290730008673832107214820587991557116806912418558069e-08, 2.169328259850323106986222296525930099935873861026310788086221e-09, -3.776010478532324328184043667556576385639846460337894963138621e-09, 6.780047245828636668305808192607091517605349478677442468580825e-10, 1.002303191046526913509281844136258004034177309673269533418644e-10, -5.840408185341171468465492447799819262905317576847426970757700e-11, 9.130510016371796243923232926650252570239054815939483900056681e-12, -5.251871224244435037810503452564279828539007071678724285717464e-13})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies27</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acbddeb1aa90e3b2f2838faf84967c139</anchor>
      <arglist>({6.687131385431931734918880680779563307675740731544063787599480e-05, 1.205531231673213234251999812212394463872002561229330125152073e-03, 9.952588780876619771874091297340545740163119816300838847749336e-03, 4.945259998290488004302995584228917712171023349013386944893643e-02, 1.629220275023933206396286389387812803673796872000118325233533e-01, 3.671102141253898226423388094379126394383458407087000700420400e-01, 5.538498609904800487605460395549044755068663194750017660900436e-01, 4.934061226779989979265447084358038959373468583404767251300717e-01, 1.028408550618229112710739475157388764479351682549490307668477e-01, -2.897168033145948463175311101489473923261698802610323264603418e-01, -2.482645819032605667810198368127693701263349361209208170092197e-01, 1.148230195177853576326445213787661879970642975306605349249036e-01, 2.272732884141708265275037216925482827043581894357907763081103e-01, -3.878641863180231062443346843661817078060143110529946543683356e-02, -1.780317409590085821070366277249759321269342801053489323888575e-01, 1.579939746024048431173907799261019471878724997312653292884660e-02, 1.311979717171553289711406975836688896451835867594492827800969e-01, -1.406275155580876537026622167053147161846397735962817855782362e-02, -9.102290652956591798241345515773322449830692586525337562864481e-02, 1.731101826549371089085675445961947677452358872325373949295769e-02, 5.796940573471798814748840657698008349462526768238833307489106e-02, -1.851249356199807710545837861298826718763077900221574749342712e-02, -3.273906663102087145481936428049519742538150452785563039743756e-02, 1.614696692239566682272152627542980896527822528487665111124260e-02, 1.566559564892457873003263983940819950829497022298967052103291e-02, -1.157718645897628140054089958116866381056430680879332334217267e-02, -5.862096345462925972966025215266179082657169806555503857975278e-03, 6.856635609684880675273184141746359000591385833807880272568038e-03, 1.342626877303679609082208800217479591902967766971379107017011e-03, -3.332854469520006162763300141047111065412307706449049389557931e-03, 1.457529625931728587128588244152604734177322144376309490881599e-04, 1.301177450244135139135787970279897042994109161268159963884641e-03, -3.418351226915427611946547437228006377896519777431057005796358e-04, -3.879018574101327604369144470124819695479087900682219330965466e-04, 2.019719879690326857104208791272390315160018069955787875123234e-04, 7.660058387068576876674274961751262847965101108848090019821555e-05, -7.711145517797584208411720507329584053382646435270054267102827e-05, -3.517483614907445391752737841583832374184046409747387149129674e-06, 2.063442647736885318487206413360228908558806028468062177953960e-05, -3.901164070638425528170558032557368703418425915665413541985623e-06, -3.657500908187104997045760131046655906827644494899206692043298e-06, 1.634369624725637835424610743915128591988676092276368687669255e-06, 3.050880686251999094242671997731089918322345713516567387655763e-07, -3.472468147394389269364673179891460601330730511237974736379548e-07, 3.286558968055159530983261866450459360074591641809187825408848e-08, 4.026255052866908637178682747490340533992340623231336911661711e-08, -1.321332273990056558848617809101876846857728483295631388083263e-08, -1.309465606856955151282041809232358209226373823424148862843577e-09, 1.521614984778521740775073159445241799352681846880808663329946e-09, -2.415526928011130660506395791946234018673860470542996426005750e-10, -4.374986224293654395069947682013996351823060759948583134078918e-11, 2.213662088067662485181472969374945928903854605356443772873438e-11, -3.295790122476585807069953975043096139541415768606924980926275e-12, 1.828188352882424933624530026056448539377272017834175009418822e-13})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies28</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a3cc93df44141d302ef32b6b6e2684e30</anchor>
      <arglist>({4.710807775014051101066545468288837625869263629358873937759173e-05, 8.794985159843870273564636742144073059158975665525081816488582e-04, 7.542650377646859177160195786201116927568410621050693986450538e-03, 3.909260811540534426092083794403768111329778710541126982205076e-02, 1.351379142536410450770749411679708279921694061092200363031937e-01, 3.225633612855224257318486139030596702170126503618082416187649e-01, 5.249982316303355562348293243640252929543774162151269406404636e-01, 5.305162934414858075256978195354516449402692654391295761050628e-01, 2.001761440459844380384404537971725815970574972480152145882083e-01, -2.304989540475825257279397658067038304888129374484095837624889e-01, -3.013278095326417816909366061441334075444383937588485826752087e-01, 3.285787916338710468450547883547348694255260871071954509422161e-02, 2.458081513737595535752949960866466132239832334168533456626848e-01, 3.690688531571127205290633425993077868843846977265847006108551e-02, -1.828773307329849166920408764650763092868965221608724574218473e-01, -4.683823374455167616514752420549419665215987106243491879971921e-02, 1.346275679102260877490923315484152662987698625205479167761416e-01, 3.447863127509970524678534595639646616244376966117385829345554e-02, -9.768535580565244174963692133038973587005628990493154911133358e-02, -1.734192283130589908795581592406238282930530566316914040035812e-02, 6.774789550190933956165341752699717255041141690153626336867769e-02, 3.448018955540951137600471926079622335842207388713342609755316e-03, -4.333336861608628393863254980828284403766309203453808666888800e-02, 4.431732910062988320487418656322338284504389482966303454010563e-03, 2.468806001015186586264188361362046240243934625858343309818244e-02, -6.815549764552309639259447104811254179605050667281644254737890e-03, -1.206359196821849005842466619530619474644989878503490321948471e-02, 5.838816627748944864497370576838809711476027837762897602935327e-03, 4.784863112454241718009916669120329848973107781600157214960003e-03, -3.725461247074254799171427871442937099025589672466088044410521e-03, -1.360373845639692436577650137133777929659265166644839235882291e-03, 1.875998668202795626152766912508562385106168761893900192731562e-03, 1.415672393140464257573780581396205840941849282748250523509874e-04, -7.486749559114629991320679819683227355746847370960399216568306e-04, 1.154656063658921251969297916771881248142872975490882572741198e-04, 2.295790982233456202366621544054366855729175050420515776344878e-04, -8.903901490044488099517361247378396756893227855233897357882978e-05, -4.907713416190250858324783990436748073854807494400738311968278e-05, 3.641401211050802781223450761733180188911730291497201507086247e-05, 4.638664981394294654002871426476885751050837817671843706915388e-06, -1.004326041333422601781848560432120920634648692782357855473103e-05, 1.247900317574834146052381692752796047052443265982232422642017e-06, 1.840363734517769191684379309039277810350620305330900536404818e-06, -6.670215479954892588747450458085225880096882699397256774967304e-07, -1.757461173209842779903676264971918635870906983281392939812547e-07, 1.490660013535362170989340065033061951960933954388633507264360e-07, -8.262387315626556965966429243600984899650039704831080988658278e-09, -1.784138690875710077191713941441263246560738410213624546116655e-08, 5.044047056383436444631252840057862002264087720676808580373667e-09, 6.944540328946226952976704718677697525410051405055662575530111e-10, -6.077041247229010224760245305596307803830053533836849384680534e-10, 8.492220011056382105461206077240377024404404638947591299761197e-11, 1.867367263783390418963879146175452376940453585791428841004699e-11, -8.365490471258800799349289794397908900767054085216008197372193e-12, 1.188850533405901520842321749021089497203940688882364518455403e-12, -6.367772354714857335632692092267254266368934590973693820942617e-14})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies29</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a05d20e73f1ed6efde32c66427ede206a</anchor>
      <arglist>({3.318966279841524761813546359818075441349169975922439988843475e-05, 6.409516803044434540833706729120596322083061716935004987374676e-04, 5.702126517773375434760843998623507494914551464968126455168657e-03, 3.077358022140837676716707336516751814713312018344719150923618e-02, 1.113701169517405304762186166370327770191325772342190715118617e-01, 2.806534559709829376968881262770480606500920092398534229615289e-01, 4.897588047621993143592705932993573539235839610055331620240518e-01, 5.513744327583751951223746071670135992466984391233429663886536e-01, 2.891052383358291634605691113586264061513180158354460952469246e-01, -1.540287344599000542466293779503370141731339982919280951230240e-01, -3.300409489175880520295083779487012611959310539629627124613719e-01, -5.570680007294085781514541931715795784309410235726214400350351e-02, 2.361052361530259415983110734054626770649468357328362426830433e-01, 1.124191748731883764769740670535880543076817816861518667898467e-01, -1.608779885941877360771615465531852333085159940159968393590303e-01, -1.078459499387214201077881957354707913786241153934264316589273e-01, 1.144722958938182579734135930060053286267822797640393386903440e-01, 8.322074716244975790297348835032537357891920536002627784941129e-02, -8.512549261563550232832311331420804581881235448862834507281486e-02, -5.502748952532572320924541450626650067707344725344841099873446e-02, 6.347916458421186633577789314698972361081611994794140119302163e-02, 3.053154327270413646637328212093941030592133225231728964047047e-02, -4.518798127778834515979704475304405691390090327474972089790857e-02, -1.291714255426679462966473962555410660387671182428076570686472e-02, 2.947043187174764111028122319949903667638786379520519899154373e-02, 2.648327307678167915542397563479749119673768286990136051577167e-03, -1.704122457360668969234196743407615179099529206118693044741086e-02, 1.737880332720511164430027824345354801611373419264590068097416e-03, 8.469725493560752287772961661104710791306496373354237126998903e-03, -2.550807127789472659145072247724735637183590942511858255354005e-03, -3.473798989681100630649790255076233970957721666820195620598374e-03, 1.877120925723650133179338154344873477230567340668548016358682e-03, 1.087053942226062966738944397844498417945523630053411148182206e-03, -1.000778327085680541055696707760062870925897014530348262794137e-03, -2.000711363076779808296301110796026470163110202848894744316755e-04, 4.111283454742767033424740543004041500054889660665367490129376e-04, -2.292018041214499897382298271438084577065170236103859181134525e-05, -1.293044840080720609161466939678226852440475312744714379499074e-04, 3.645026068562774967665464216602750761690984830805534178557146e-05, 2.913344750169041218495787251929571015775436967652945386217480e-05, -1.657328395306616289863396387854880512976861409870690029695161e-05, -3.593644804025187638066915189731950450034629392522542962477168e-06, 4.750609246452552850197117564759363194953518317428400241629683e-06, -3.029054592052818286474228294307141792053791695855058563299597e-07, -8.975701750636280734511651941681818767895052287332471537510510e-07, 2.633898386997696553900967704111473475368019612368922599394214e-07, 9.387197411095863026484410601284876812292554863800653292318725e-08, -6.286156922010786166768503252870590953166867739448102804392389e-08, 1.076591906619196137385201975028785139607670319821266803566785e-09, 7.768978854770062238895964639391324551611701293594055935346266e-09, -1.893995386171984147774611076618946011337498790609031626697228e-09, -3.426800863263089001811012278889864200550342566386405676893537e-10, 2.407099453509342962399811991929330725186626582891090462239366e-10, -2.940589250764532582888473974638273664244682541297835986306504e-11, -7.832509733627817032356556582819494794884131433810848844709881e-12, 3.152762413370310423797539876893861621418382024668704492620948e-12, -4.285654870068344101898185073376307686875386259541180967347399e-13, 2.219191311588302960934661700068023727737812918006011019184982e-14})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies30</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>af4bd657652295c5d81bfc58690e2a1dc</anchor>
      <arglist>({2.338616172731421471474407279894891960011661146356580425400538e-05, 4.666379504285509336662000111055365140848987563882199035322085e-04, 4.300797165048069510045016757402827408493482974782286966500398e-03, 2.413083267158837895194919987958311943976725005113561262334092e-02, 9.123830406701570679321575555085899708564500191080751595642650e-02, 2.420206709402140994467599658342919512318194032687898436229538e-01, 4.504878218533178366981351802898336415314944375740699506554771e-01, 5.575722329128364304078082520999850413492571645754785374629734e-01, 3.662426833716279793144871151369089533016299234992584741629624e-01, -6.618367077593731501909741041813726474911212544474895441395148e-02, -3.329669750208556069196849320598850505877494561268613506392514e-01, -1.419685133300829310219026267403758254954270602825020111483505e-01, 1.994621215806643032428990062111230223523226088131364328774921e-01, 1.778298732448367361280250921330425046260289700971176750362566e-01, -1.145582194327077814891518778613672243404957549114393749173137e-01, -1.572368179599938126878197378886501553251711910617673398124611e-01, 7.277865897036442699893544326605244235248713804556715604416632e-02, 1.227477460450093778691578797698150091624353365248212907325446e-01, -5.380646545825707676022015051837304300338645984615639237930800e-02, -8.765869003638366048026572053699028353846982304851342479893827e-02, 4.380166467141773250305407710250135373016604593736480428415303e-02, 5.671236574473569492590636983030617493807140224924978946302257e-02, -3.567339749675960965780819743176056734137251336781389369397564e-02, -3.226375891935220815954913483392725682165778426411705216010280e-02, 2.707861959529418272206848318420006522973840949600186710327776e-02, 1.528796076985739546052896626042375110302102640936712142026221e-02, -1.839974386811734118728169880549148389603890445324127330811811e-02, -5.296859666131086629169938675330494864053932988161015674773617e-03, 1.091563165830488927536881480211929049886878831313700460017968e-02, 6.196717564977244383592534999284255315694546230739551683085460e-04, -5.530730148192003288871383856487027893918513053091795443517653e-03, 8.433845866620933982126003584365932145598126087481400294999080e-04, 2.324520094060099304385756339638431339131122661576649123053845e-03, -8.609276968110423879660725173525347077801305237644122054954659e-04, -7.678782504380918697963922441514742758516706160788123977340073e-04, 5.050948239033467796256544554086554367969638627715114003635557e-04, 1.724825842351709725545759714374272164367933578194910678479473e-04, -2.161718301169633804271038862087964094429005266172702380483361e-04, -8.548305467584070994787824796256108217987765582429940610377190e-06, 6.982008370808327851082027193100914402221658444151889697045071e-05, -1.339716863293971629296314599448901465078920406443516550195793e-05, -1.636152478725426488654528710478856195004608401773950511915162e-05, 7.252145535890469015723401169934327900622894130695550273452916e-06, 2.327549098493686509557358103785598216688723737824121617676858e-06, -2.187267676996166416699555236143059249832615777542412142603694e-06, 1.099474338526203304286307383463498542376432972308342428764576e-08, 4.261662326011572446469849114416378817419458434583398455985144e-07, -1.000414682354500898864979332965559934104686157639553850670490e-07, -4.764379965139453357729154748688006975561934425368712852985388e-08, 2.605442754977625431940885841950955928085338672381046225838880e-08, 5.553397861397053982967618072672572206490972606026556946910028e-10, -3.331105680467578245901976412732595596538702049437802824373020e-09, 6.984862691832182584221096665570313611280449991512869846064780e-10, 1.613622978270904360610418704685783656905979134344922647926295e-10, -9.461387997276802120884525814092001871993910062127702293573920e-11, 1.000105131393171192746337860330428369495110180346654025287492e-11, 3.239428638532286114355931428908079297696045600279108835760520e-12, -1.185237592101582328254231496310584611948560976394420324137742e-12, 1.543997570847620046003616417646988780670333040868954794039905e-13, -7.737942630954405708679963277418806436871098329050829841696327e-15})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies31</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a8cb2b50c01e5bad5c3b98876520c0be9</anchor>
      <arglist>({1.648013386456140748122177817418358316441195236228590958603489e-05, 3.394122037769956699157160165352942212213928231154233571163033e-04, 3.236884068627721221829662672296912258338131668810067169630813e-03, 1.885369161298591269159568944275763468999829139547989648553486e-02, 7.433609301164788697908776495388047669378919816041031344650271e-02, 2.070128744852353286198055444111916450619762837756134323019573e-01, 4.091922000374278563928213235836188963704298775635493549519369e-01, 5.511398409142754983590484577074663132074992263886810324421617e-01, 4.294688082061372955430413148799008354573408538414331312236645e-01, 2.716921249736946422305354732634261873401679092095992827198308e-02, -3.109551183195075186926560285811004715398678229333522634202008e-01, -2.179784855235633521693544507220105631639547435903112747133934e-01, 1.401782887652732681656253206993073895422881511380152633441096e-01, 2.249667114737370933697297905066886078307490136415302624018330e-01, -4.992634916046823977000579399730138693074543903234092797936484e-02, -1.869623608957154494374577196258383009208655076187653847079167e-01, 1.543698842948893409652995335281236231845293548571166883219023e-02, 1.450895009319931981518942907854879059128872873116921504156674e-01, -8.139832273469236863527708715566588550006680549152344840146851e-03, -1.076127733234956326668605511648013952380301953590447106075614e-01, 1.094129745236496925725237900637802669504835743555466811796369e-02, 7.535361174328140695528289751109133941376701984419452638686226e-02, -1.488002661810482202699555987503429289100801979910046913257306e-02, -4.861907546485433003537603385831190109391263542044516048871113e-02, 1.615417156598591113619453864586701665635869166193865651960591e-02, 2.804761936675616906861927211659154977049392281479113764697785e-02, -1.427627527776351943309800140756746087215016194775579070599004e-02, -1.390055293926652880755898888934447671732373519028670201124816e-02, 1.051763948737184089128633441244991643331033825102031908858652e-02, 5.516163573310992566561289762241160214476622662764637181816550e-03, -6.520852375874612553325469682628530079210293774541131381751695e-03, -1.428264223218909891400516038687842292177211292295049238921068e-03, 3.393066776715931928419358796960612411097347419792355896915546e-03, -6.397901106014600492881202314307290077992972755016494062875201e-05, -1.459041741985160943114515221598080223845239255190055621901681e-03, 3.431398296904734438118401084929505912208229684629857530009147e-04, 4.998816175637222614896912406679513231966722440032799024979502e-04, -2.396583469402949615285646688069476140260781708006174912535660e-04, -1.243411617250228669409179807383399199879641177993453588807726e-04, 1.089584350416766882738651833752634206358441308880869184416670e-04, 1.501335727444532997071651937630983442758297688087711521441229e-05, -3.631255157860086164261313773172162991107348698083164489165837e-05, 4.034520235184278839752741499546098778993926344831736074409765e-06, 8.795301342692987765440618030678349427367022581211855857458220e-06, -3.035142365891509630069007852947057220760887215249503512783023e-06, -1.369060230942940782050489751987123955074404782177163471279285e-06, 9.810015422044371573950976088058064384946146188110905321673802e-07, 5.327250656974915426977440959783080593776012130063170688309127e-08, -1.975925129170206248152121156696590501303803187231928513867046e-07, 3.616826517331004805247567218405798591329788122337274956172315e-08, 2.328309713821409644308538888589329921141948539678106680777082e-08, -1.061529602150252306500404266150823962402673780484965538270541e-08, -6.474311687959861398702581539341954438747926255671605657095807e-10, 1.408568151025177427076547804944585301332087108125727813194374e-09, -2.524043954153353306183643702933218308617979467184848456565837e-10, -7.348930032486263904766913919653624379586487437915175106407348e-11, 3.692108808871129411604189196259677640440919369478263728899602e-11, -3.327008967125979929910636246337150851642079794871116041187279e-12, -1.324334917243963163878274345609465717294426628053460151843705e-12, 4.445467096291932163298411852093011459626037560439178917611592e-13, -5.559442050579014337641375730083534521513818164827556763756543e-14, 2.699382879762665647295493928801387173921314576598505507855504e-15})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies32</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa79718535fee470d50d1a4e91bd2da90</anchor>
      <arglist>({1.161463302135014885567464100760659332951431420121048996305591e-05, 2.466566906380903352739104211274667134470169443886449124673996e-04, 2.431261919572266100780423071905958127811969678055971488060574e-03, 1.468104638141913563547809006402194831107662001343421893488086e-02, 6.025749912033537081745451975527967031851677384078997261920024e-02, 1.757507836394388988189299915753348505208376399651864661397588e-01, 3.675096285973496361995340339143234125206079560406868595968025e-01, 5.343179193409538322901117858552186425529774700290587495921679e-01, 4.778091637339484033555130814414794130354053753675509287934741e-01, 1.206305382656178269538098710665261299391507308342013788891222e-01, -2.666981814766755535489784087869865024226542605534080371507405e-01, -2.774215815584272153338153320303401666681294506143291967655666e-01, 6.471335480551623831000090095167664918448659157720155321560811e-02, 2.483106423568801736064852157222867588791898170114101300999760e-01, 2.466244483969740441701479334808723214802614938081258920635302e-02, -1.921023447085468984341365278247990525863123891147783426068990e-01, -4.899511718467173853355943225576377418394280156945986899417475e-02, 1.452320794752866460838830744051944832326998342053148426312341e-01, 4.440490819993974022640619534046603571086531544468421519143629e-02, -1.094561131160893831027722774343269232755171130623890041619420e-01, -2.962787250844770491204452379051215505049068645551070779367843e-02, 8.087414063848395744090831590426327690818854671836423275412813e-02, 1.410615151610660772869738802931740150275269382463799031013905e-02, -5.692631406247843550478416271158537960555270097953330567652364e-02, -2.380264464932573834443178362086503847328134994591954135879789e-03, 3.705145792354468010437633458013030898015496905609424004450953e-02, -4.145907660827218781460700428862611061267328108653649653634276e-03, -2.166282283639119347634778516947485598599029367518033869601702e-02, 6.167527310685675112579059689520105004744367282412921739811164e-03, 1.101740071540688116532806119564345712473051769079712407908648e-02, -5.411568257275791208581502410752383050600045942275647685361370e-03, -4.649216751184411528658094984504900172989190128905887602541396e-03, 3.627224640687864960122122984391704782343548385375321260251988e-03, 1.468955100468467772528811782840480639166582822577191079260543e-03, -1.964740555821778254183647540656746450092725858126595984907304e-03, -2.211678729579097916278097586914956834196749138610403102772710e-04, 8.673058518450555343925662389563539890596549655683386287799624e-04, -1.024537310607396186949656796812972062290796122915930356634122e-04, -3.059654423826911750479261161552574500739091332121504634422577e-04, 1.053915461739828114700905192091104141076083602686374410146603e-04, 8.103678329134838389828091896334156224227821362491626044950428e-05, -5.259809282684322782648914338377962890245975842272425408122506e-05, -1.294045779405512723950480259110995722517019870286295908085366e-05, 1.824268401980691220603850117995712615809177092802967489081228e-05, -6.361781532260254953363913076575914206506177493714496098327288e-07, -4.558309576264423135123964145585288808181431652781253437738445e-06, 1.202889036321620990296134494079846952404216422923750605507047e-06, 7.560047625595947819392627283726711361273296630256477108501994e-07, -4.285970693151457255418342315045357407199066350632593899896712e-07, -5.003361868748230293692887222336390314786090450819216035110269e-08, 8.965966311957728376981484572655177545054433542721057470726361e-08, -1.219924359483373093110396748985081720383992859961285213840740e-08, -1.104383021722648979552131128575075255513372249283096583736746e-08, 4.250422311980592983740943309197245384991941251563471671065543e-09, 4.384387799940474369553236949848427579687147486892033587998023e-10, -5.881091462634605628881794361152305108432139465417759716875076e-10, 8.904723796221605490455387579189371137903330749397374037644960e-11, 3.263270741332907875981844980104948375955551273115386408552080e-11, -1.430918765169202320188022211739750594608742928641485026836608e-11, 1.075610653501062115165734990153347111902874668945095034791947e-12, 5.361482229611801638107331379599434078296259332654994508124989e-13, -1.663800489433402369889818192962259823988673359967722467427927e-13, 2.000715303810524954375796020597627467104635766752154321244151e-14, -9.421019139535078421314655362291088223782497046057523323473331e-16})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies33</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a939e583852bdfc636e3696db658b5558</anchor>
      <arglist>({8.186358314175091939858945975190102731733968885547217619434602e-06, 1.791016153702791479424389068736094134247294413108336017758506e-04, 1.822709435164084208084617771787691709255513374281497713580568e-03, 1.139594337458160925830840619716397130445853638888472948832932e-02, 4.861466653171619508385707681587366397164931431125053574327899e-02, 1.481863131800528081784673514426737436792606299953305691300616e-01, 3.267181301177075783930752787756046348844272437670999719562429e-01, 5.093761725149396552227892926384090200953139820961482931291482e-01, 5.112547705832674655425831875568453973369927971748064975152374e-01, 2.095823507130554216526494469993023406452629154801126958766008e-01, -2.042026223985421049629055102642279430174095014493415546881477e-01, -3.159974107665602561905181464284910961862968513875028980451424e-01, -1.927833943695275915600583425408664108893845271616240406358226e-02, 2.454206121192791114179964351253140999836791489738418857473689e-01, 9.985155868033815698139640215477639365289384281516885362929979e-02, -1.714280990518593279308738113273443832545615219650436927029674e-01, -1.108441331167107910806084983056783194189909198734302929909672e-01, 1.219678564037346149389134584371009777591763921148126952722200e-01, 9.478808805061595889263191779090571160237408179346345390888721e-02, -9.114696835133148913093153757138373418923462847746880902676089e-02, -7.030248505405615921453280814171665167171986608963193275084895e-02, 7.019114394099653254998935842432841393915841096633514680190145e-02, 4.573456189389667743139040427641638967843459421665709740086516e-02, -5.347125133582228919431110824663168583260050383336359554980188e-02, -2.524858297747649929258392207837724793937727346177294684700378e-02, 3.868706076024496481748675031852528047303323816250150793091832e-02, 1.070326582001954942654534968137727769698168853186071888736311e-02, -2.572876175473297336123211392278301875687760837710204579628265e-02, -2.167758617353607324783298657172830203896433848418061622436727e-03, 1.531695411585766548347442266431874060229304787191589430967538e-02, -1.594288782414604768637856446111392724059836934455189837500244e-03, -7.953540387057939240459305406538116220678495240302592677582773e-03, 2.389062408165908575935815973439728988151836094753689966108405e-03, 3.480800953405711999411461002429227385937942254778524257436278e-03, -1.860718214455795912074482150710567824317228203897000129729967e-03, -1.204309257604658876916644980097327372892008586047095719636829e-03, 1.074380696351291355073899234941719080473877020595209197706651e-03, 2.727305847336937211749282358350196461733595290569540045817329e-04, -4.908329007590351474487792254066540683724948757382104652497458e-04, 4.393166251766185755059005296958129844094063524324718175254673e-06, 1.780431898251245351831728023200069586928513661382622116969992e-04, -4.160438516273709306234368807933932360567787692918883118883736e-05, -4.929564423417301834310231482621574127409950921583062559483686e-05, 2.423335398816890365621188379922041046073808819182024026589770e-05, 9.070805757828453800203677464921508178468256685438211818575040e-06, -8.866121366757736169176034432364298134186929098274651022820760e-06, -3.607516102879771631230351118595069330196155459105589342866625e-07, 2.288371276141527305481395545993763010565968667577768164201792e-06, -4.426923407952870147984002129341809185622768353983550670755106e-07, -3.985791291985944076942626511739220753169387460984290019185514e-07, 1.822443332571053437467128998002798233969112236553215291639303e-07, 3.377972703730854377516206663481869099376154259897212784144779e-08, -3.987838198518880722819502850814936369197384392561970319349663e-08, 3.672863576838181340505563759379169099717712645283448779390320e-09, 5.111211857347453839549366593998758891130921028374576213256027e-09, -1.671392677251932495173219614104411841891545601521784559793012e-09, -2.496402105246193648073519269370197331176405371538404298745013e-10, 2.426833102305682309891302883361232297664099485514601790344279e-10, -3.049574453945863430361296931455141500128170151643206937547928e-11, -1.420236859889936792437077844940412749343225644487770840543290e-11, 5.509414720765524548752673631197714447818740985929081064907524e-12, -3.343481218953278765982532722689984725170758193566174566492199e-13, -2.152488386833302618520603545685994753329478275805993737095214e-13, 6.214740247174398315576214699577230693021307854673557214652751e-14, -7.196510545363322414033654470779070592316600780697558361083151e-15, 3.289373678416306368625564108782095644036415401902518812978798e-16})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies34</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ae0b85b53fb751200edb000c34cf3f3d4</anchor>
      <arglist>({5.770510632730285627466067796809329117324708919047900817738025e-06, 1.299476200679530037833484815390569400369432658207722720405084e-04, 1.364061390059049998200014449396877439591680435610837369411339e-03, 8.819889403884978803182764563095879335330977939541630862804757e-03, 3.904884135178594138905026219591569204043816577941517019631916e-02, 1.241524821113768081954449898210969172708199672428635378051285e-01, 2.877650592337145629334256618087718872558560120999651277991839e-01, 4.784787462793710621468610706120519466268010329031345843336104e-01, 5.305550996564631773133260223990794445605699030503652382795600e-01, 2.903663295072749510455945186199530115755664977934564128822650e-01, -1.282468421744371672912377747048558427612774932943748628650824e-01, -3.315253015083869417715548463087537345035828886426345397256876e-01, -1.038919155156404718287260506925867970596448618647006698388596e-01, 2.169072201874275950610018667099322465619408030256534197819784e-01, 1.666017504122074437311574334509261366682993700573488534577890e-01, -1.273373582238011562843862636988693890108793629966541695807247e-01, -1.609249271778668063014799490429649196614628857267382976958607e-01, 7.799184693794810738265349531832015087096882277333968473726399e-02, 1.341259602711361284802399913977387999358280900708582462625539e-01, -5.448296806413904636632671383140642554265865948686157271017286e-02, -1.029475969928140852342073823689090498245496056845473569066667e-01, 4.357609464963129726428486610925800727137724136370669421246609e-02, 7.318523543679560555546221335452045680757998947493883124934567e-02, -3.701283841786244960356402125554190040750079009127461655784927e-02, -4.743855964527776247220681410983851377889756018716427358008296e-02, 3.073974657395934459931226513844134346305562928466993208164603e-02, 2.722835075635419610095839895805858855202745897718117731496534e-02, -2.367173792282636485046786438094940427456079528043555566867110e-02, -1.314398001665716086105827506126287041342680578404007359439612e-02, 1.640937419986519252112261495537409592363156309874473310057471e-02, 4.713649260999809905918876125437488856235874027077755004539205e-03, -1.004550670836151917439146861146431000364858401181337134891421e-02, -6.194748845153872839014356621835501857322345445234809347431098e-04, 5.334950768759936032170270195983921511565539100791906952901398e-03, -7.692127975067836975989490900561029844887285335804349474993607e-04, -2.399453943537055863933124827688081952701780599883067560501870e-03, 8.589959874363661955444898475746536583497522107459291718900058e-04, 8.751999064078688732610570055224339733760304773327228476255647e-04, -5.527355762144197975516415296735124460550632283763688359649888e-04, -2.326732140233531635428863212833942245597361085708567528230733e-04, 2.650772397558057819755811309071002543822145660933016957735937e-04, 2.660050018453441903046828468025589086403126180798464347801678e-05, -9.914697770780134603580350758869378471802751837608461971022567e-05, 1.353117227249649581251887376414486225127346352042209141315562e-05, 2.844951419697807376503080001943765930601242225183893658540032e-05, -1.057657494257950623848316304755218120233253479317574337409622e-05, -5.710826510998303938275050074333400305512451419983646591762318e-06, 4.169871758547028398316761659984928804362023643629741358799744e-06, 4.979718101421307748081857636471761057429219265531618602960147e-07, -1.116306534817008428597995070751765080383261658112656948526954e-06, 1.448195708333185127061180618150009526758658641231104901703561e-07, 2.025990666667859216690536885693725545344933235432307649205497e-07, -7.526701740412589411177481797841044281662555785969415398369019e-08, -1.990346501531736915866180448337614967570744211158241514589121e-08, 1.740423332936068076497051274445147160190783847854409836489662e-08, -8.665744261368722215864741166245385888818567571145958531936939e-10, -2.316501946995482751582294240136010067415084499025753117941001e-09, 6.446378210323402313101214894500231181606520211579581132442548e-10, 1.300410318609415248880403259300467720631189120978928377152233e-10, -9.904774537632409015479530333979124540183199174591377762845227e-11, 1.004208735461769864836516428998306778031143650101842361622330e-11, 6.080125354000167254059025929915591291115751734288584563131636e-12, -2.107879108915301546285370395443778864676275235126044599683271e-12, 9.799451158211597727901178520526388692140586041163624252991805e-14, 8.579194051799733179793112298652600511486581216528683482143106e-14, -2.317083703906408481078257081903089523234020423092175261925515e-14, 2.587338381935699555813538163144986688834142571207152879144731e-15, -1.148944754480590128244815794312606245147888158018823490936280e-16})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies35</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a9ef21ae172498bbd4645a909c8dcecca</anchor>
      <arglist>({4.067934061148559026665247110206084571051201477121972612218005e-06, 9.421469475576740631603027533116630224451049736050903361458759e-05, 1.019122680375098109319314672751485080202557607467199213778085e-03, 6.807292884319132011971333979015625113494050642797397817625326e-03, 3.123628851149071453063391210769353068187088999495893257051179e-02, 1.034044558614783789938787754929279183985553322796063517049140e-01, 2.513073789944933128513251971488905042866779761014740192816902e-01, 4.435927392240354378183910489448494594782039032807956294826105e-01, 5.370084275091661028670690231716974547580034932361053607723887e-01, 3.603456405180473278744458573988718422538114217890792270621563e-01, -4.388388187393404111343479394097224312100349011932028865098625e-02, -3.238228649121161212147302807993176715625480327235512530593160e-01, -1.817869767667278325788350264528191676841493369460849123538616e-01, 1.660413574907809195438433327470947940538097914525298064477785e-01, 2.172992893210892977675493456199559114036326358517672106972956e-01, -6.526287131067753892154895911331108284007380738865652420304233e-02, -1.919195892985939528760786800798636198516495957924798820500876e-01, 1.930954466601835091947734585938109944647435243484967057775110e-02, 1.552924803962371144206753760712566993987319378965231186477630e-01, -4.752680834111350445288110998030979143710864689041902167119118e-03, -1.205855226433935545076589480704957722635324456812322150437989e-01, 4.734229172641948763293980314992213293971770695480616789828384e-03, 8.991354757072954417865374195261962983644048998218233900481856e-02, -9.318558949903924837875002823617504227246562152671894579504378e-03, -6.335603744044346612098887534020545705731671718057964802006671e-02, 1.322854958503655524455929847605110719648746890497356808289302e-02, 4.125469306470509212749750814299126656151504805845417994651417e-02, -1.436683978422007182104025173214012797788904894291716373493525e-02, -2.416949780166026740294880681731084091264533168816746227537030e-02, 1.276645671565674419403918018742432714973656598227939824940035e-02, 1.228943600811871086161967625814297050611100200023898377949151e-02, -9.577797899235709998147309703713518608283233882793489733491642e-03, -5.085991649233429881797636583578921194675393807761154549733547e-03, 6.137754586740521089596801883631921221145712545042519987641234e-03, 1.428088794070762107355585870669842132609159040625895090070111e-03, -3.357644380922383229567732565298665639037348585961127075507937e-03, 7.615969435172736546769649923895317451534703066016116257300160e-06, 1.549637469702362975561719246539787717204438637997824935787688e-03, -3.346692164250854961608526121524596908041109918361306282201310e-04, -5.864810318991817532175809224131456738367101035694188223408841e-04, 2.648328819961289039302810122699710966048565368047575218693134e-04, 1.700012283661249043584690194716767771204207742625746308522935e-04, -1.365883072261161602559926714744746422567509177443594045709653e-04, -2.976995962848509743944225866488519668585242655980656646544319e-05, 5.304143122913310222538317980686374696005605533475685587486683e-05, -2.437001526827789860990429478540556752694389693432668831073769e-06, -1.572442077270281693663288966405861215692805972737981986121447e-05, 4.308047861716731191350493437937513220737450410132878032163179e-06, 3.353345862871309889390877168046133657377105681618708355266688e-06, -1.895929617693153288493891051875444439753318548105998166574535e-06, -3.903931733287306166657519468494511920760767388397825775326745e-07, 5.302368616904760917074352633915743250769600635829229600812520e-07, -3.700308378205124537986402644918879149894035910106489082512364e-08, -9.990396944534900755781728477561240762191443422318249128866740e-08, 3.008188650719066928230268918661718274504955045022550217051301e-08, 1.084902733789934825266560240100449884702749303326571747323086e-08, -7.458116552893037631192407611262788593505988638365840409367117e-09, 5.897951310384361575470355861162022501172491937837712969865619e-11, 1.030823345485433383811700481488557422005210168069163779730908e-09, -2.433545573751672936168877250405940817227367937230289801251648e-10, -6.407938256501889018430608323235974406219193176918284664973727e-11, 4.000536627253744510742788201354093006471710416671002244302586e-11, -3.125639357108557540598098228678150768528121565391376265627294e-12, -2.567065476155081449204643852428401530283519685638256074752850e-12, 8.015088533687900921948605418789324826115616416343391081288979e-13, -2.597954328893848084315198205094389145706680129208998638802995e-14, -3.397720856796267431956783825659069596940335130100871912329556e-14, 8.624037434720089202680337663692777682810714650060805832406135e-15, -9.298012529324185420921555664719863501848315099116725184370339e-16, 4.014628712333488654318569164614220308046021091178184654250982e-17})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies36</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acc368cefd23cd05c3ca28527fb2275fd</anchor>
      <arglist>({2.867925182755946334630479473029238615535511775894262711054705e-06, 6.826028678546358691748629102209605362240344266505035981791715e-05, 7.602151099668488285869792677106082100141275054892389379198545e-04, 5.240297377409884366201603524392995696042174937194435235003941e-03, 2.489056564482796484885927333959115579403023347044729739255255e-02, 8.565209259526409083864716995521111486437594750377856524772704e-02, 2.177569530979008149637945915719999746248969705650625533415876e-01, 4.064336977082553467407793990250384445903151630768558142125382e-01, 5.322668952607286914777444748641462027213554723153906901129337e-01, 4.178753356009697863620634559374236455222275302996931178265919e-01, 4.397519752934862993862182898358763783110745559238982179690132e-02, -2.944210395891145711100715969898758940722458887377844633443675e-01, -2.468070369781255270524798278622698446566520718230313889086016e-01, 9.811420416311477050518401371401568038943437322299913514049728e-02, 2.465372776089742110529709111809595434656418762898152706621356e-01, 7.278515095792229009687682299460382878643139026668958884429641e-03, -1.993372056086496198603363400094784142714162256792182570541036e-01, -4.586140074639271639145126228774831743002971373998329604574394e-02, 1.541062366276428841776316300420654875883842819413623395358262e-01, 5.027618007353842862036816972809884096761706036019748316890913e-02, -1.188037543101356316801816931383547446073152951044444224449501e-01, -3.988085357551317584091699967924044034100374257075864260934102e-02, 9.115678225801654406336059281306715151058903055370522031843771e-02, 2.503872144956848989919484296709846860569180993040383621980546e-02, -6.820901663681751124880436344265538690580358108714540763125119e-02, -1.131910031681742794381808082173695022123056280821611354577883e-02, 4.851308354780908538616267662315735632292989749013261207046367e-02, 1.424972661765391603147802607378542396323429657660009755652404e-03, -3.198072067763969654470293513742344601172739688274251641873778e-02, 3.984040198717004857397179486790082321314291366656151213429068e-03, 1.906359478062535932877576164368198274858108513696832728889209e-02, -5.657813245058818380424016973516714570499161434975761798379020e-03, -9.990263473281372348001743806489172665465685056975652497503772e-03, 5.022989106665829004699819220796538830393945994687289792465541e-03, 4.413484835350575251918616780287775585471012556848037301025999e-03, -3.484541445404883311209541395428535732697661971818727286003028e-03, -1.503074066296643749549363655363411879858070202740814054964603e-03, 1.990793771851737270404293245701878186600899439513475823305914e-03, 2.776812795712026068152384207605140383490242756921936501940389e-04, -9.463403823261101964604918059447913047725482130063492242779878e-04, 8.614565758992702032613879159402330909634737204578606399403107e-05, 3.693507284967510502620040341882236687749563414433432842567511e-04, -1.155118895843527096848376999413102395191976350936666573818799e-04, -1.131899468084665671727391922924411467938450743565106978099456e-04, 6.694741196930590257104231749283786251555566773398199990337698e-05, 2.375106683660860777161950832380341362257503761490580896617678e-05, -2.731390824654337912922346414722045404779935825834384250023192e-05, -1.183471059985615942783182762352360917304348034947412986608322e-06, 8.372218198160788432628056043217491552198857358432112275253310e-06, -1.586145782434577495502614631566211839722879492827911790709498e-06, -1.870811602859180713762972281154953528056257451900381097476968e-06, 8.311421279707778528163597405935375886855029592150424544500718e-07, 2.548423522556577831218519052844387478819866531902854523544709e-07, -2.455377658434232699135878286794578515387138194247693201846263e-07, 2.753249073339512254085076456700241929492720457889076058451072e-09, 4.799043465450992009934526867650497683545716858606119786327559e-08, -1.156093688817008406756913949175208452083765368825442482226093e-08, -5.612784343327791397474114357094368557982413895802980814813369e-09, 3.138841695782424018351567952158415003571380699236147752239001e-09, 1.090815553713751810964713058800448676068475673611349566405716e-10, -4.512545778563249634425200856088490195004077806062978067796020e-10, 8.962418203859611987065968320295929679774693465791367610044773e-11, 3.037429098112535221800013609576297196061786927734556635696416e-11, -1.599716689261357143200396922409448515398648489795044468046420e-11, 8.876846287217374213524399682895564055949886050748321818411161e-13, 1.070969357114017002424433471621197579059927261727846375968378e-12, -3.029285026974877268896134589769473854669758797446795757329862e-13, 5.542263182639804235231685861028995158694397223907295269180336e-15, 1.338071386299105896025578761458472955294763310766371178363783e-14, -3.204628543401749860439316638848579711789176444320134355253750e-15, 3.339971984818693213132578777712503670014459411167839211495237e-16, -1.403274175373190617489823209168013922564353495443487431242610e-17})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies37</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a22227a818d804d3fce02a290a07471e9</anchor>
      <arglist>({2.022060862498392121815038335333633351464174415618614893795880e-06, 4.942343750628132004714286117434454499485737947791397867195910e-05, 5.662418377066724013768394373249439163518654840493603575144737e-04, 4.024140368257286770702140124893772447952256842478891548092703e-03, 1.976228615387959153244055502205017461538589475705618414896893e-02, 7.058482597718160832030361890793007659963483925312132741868671e-02, 1.873263318620649448028843491747601576761901656888288838192023e-01, 3.684409724003061409445838616964941132670287724754729425204047e-01, 5.181670408556228873104519667534437205387109579265718071174178e-01, 4.622075536616057145505448401528172070050768534504278694229363e-01, 1.308789632330201726057701201017649601034381070893275586898075e-01, -2.461804297610834132869018581145720710365433914584680691693717e-01, -2.943759152626617722808219575932673733674290772235644691367427e-01, 1.967150045235938977077768648740052380288156507222647187301894e-02, 2.515232543602686933435224095078166291442923992611593827552710e-01, 8.180602838721862339029076982652411696000045533716726027662147e-02, -1.819622917786080007408824256525225216444443143868752611284260e-01, -1.084517138233017845554078812341876568514835176341639783558543e-01, 1.299296469598537527842528895259188653120602318620944502979726e-01, 1.017802968388141797470948228505865617480048287983176581607964e-01, -9.660754061668439030915405045955772715988585374771282291315496e-02, -8.233021190655740867404073660920379414988302492018783774702028e-02, 7.504761994836017933579005072594245435071674452882148228583865e-02, 5.956741087152995245435589042520108066877114768216272503684398e-02, -5.925681563265897095153806724965924334077555174281436189512239e-02, -3.825382947938424882011108885090442116802994193611884738133373e-02, 4.580794415126833246633256156110381805848138158784734496981778e-02, 2.097280059259754883313769469036393294461497749083921162354229e-02, -3.352358406410096994358662875913243067234786296009238949920582e-02, -8.833493890410232394064187990625563257107429109130726291528648e-03, 2.261865154459947356571431658958802912061105608212828675323452e-02, 1.690472383484423743663952859090705636512807161536954018400081e-03, -1.376398196289478433857985486097070339786225136728067000591187e-02, 1.519305778833399218481261844599507408563295102235964076544334e-03, 7.387757452855583640107787619408806919082115520707105052944171e-03, -2.248053187003824706127276829147166466869908326245810952521710e-03, -3.394523276408398601988475786247462646314228994098320665709345e-03, 1.816871343801423525477184531347879515909226877688306010517914e-03, 1.263934258117477182626760951047019242187910977671449470318766e-03, -1.111484865318630197259018233162929628309920117691177260742614e-03, -3.280788470880198419407186455190899535706232295554613820907245e-04, 5.490532773373631230219769273898345809368332716288071475378651e-04, 1.534439023195503211083338679106161291342621676983096723309776e-05, -2.208944032455493852493630802748509781675182699536797043565515e-04, 4.336726125945695214852398433524024058216834313839357806404424e-05, 7.055138782065465075838703109997365141906130284669094131032488e-05, -3.098662927619930052417611453170793938796310141219293329658062e-05, -1.639162496160583099236044020495877311072716199713679670940295e-05, 1.354327718416781810683349121150634031343717637827354228989989e-05, 1.849945003115590390789683032647334516600314304175482456338006e-06, -4.309941556597092389020622638271988877959028012481278949268461e-06, 4.854731396996411681769911684430785681028852413859386141424939e-07, 1.002121399297177629772998172241869405763288457224082581829033e-06, -3.494948603445727645895194867933547164628229076947330682199174e-07, -1.509885388671583553484927666148474078148724554849968758642331e-07, 1.109031232216439389999036327867142640916239658806376290861690e-07, 5.350657515461434290618742656970344024396382191417247602674540e-09, -2.252193836724805775389816424695618411834716065179297102428180e-08, 4.224485706362419268050011630338101126995607958955688879525896e-09, 2.793974465953982659829387370821677112004867350709951380622807e-09, -1.297205001469435139867686007585972538983682739297235604327668e-09, -1.031411129096974965677950646498153071722880698222864687038596e-10, 1.946164894082315021308714557636277980079559327508927751052218e-10, -3.203398244123241367987902201268363088933939831689591684670080e-11, -1.398415715537641487959551682557483348661602836709278513081908e-11, 6.334955440973913249611879065201632922100533284261000819747915e-12, -2.096363194234800541614775742755555713279549381264881030843258e-13, -4.421612409872105367333572734854401373201808896976552663098518e-13, 1.138052830921439682522395208295427884729893377395129205716662e-13, -4.518889607463726394454509623712773172513778367070839294449849e-16, -5.243025691884205832260354503748325334301994904062750850180233e-15, 1.189012387508252879928637969242590755033933791160383262132698e-15, -1.199280335852879554967035114674445327319437557227036460257649e-16, 4.906615064935203694857690087429901193139905690549533773201453e-18})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies38</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a1a2a4af5fc67d3569fe82647d8b7de94</anchor>
      <arglist>({1.425776641674131672055420247567865803211784397464191115245081e-06, 3.576251994264023012742569014888876217958307227940126418281357e-05, 4.211702664727116432247014444906469155300573201130549739553848e-04, 3.083088119253751774288740090262741910177322520624582862578292e-03, 1.563724934757215617277490102724080070486270026632620664785632e-02, 5.788994361285925649727664279317241952513246287766481213301801e-02, 1.600719935641106973482800861166599685169395465055048951307626e-01, 3.307757814110146511493637534404611754800768677041577030757306e-01, 4.965911753117180976599171147718708939352414838951726087564419e-01, 4.933560785171007975728485346997317064969513623594359091115804e-01, 2.130505713555785138286743353458562451255624665951160445122307e-01, -1.828676677083358907975548507946239135218223185041410632924815e-01, -3.216756378089978628483471725406916361929841940528189059002548e-01, -6.226650604782432226643360160478765847565862101045597180310490e-02, 2.321259638353531085028708104285994998671615563662858079262996e-01, 1.499851196187170199586403453788927307298226028262603028635758e-01, -1.417956859730596216710053144522330276392591055375830654519080e-01, -1.599125651582443618288533214523534937804208844386102639177693e-01, 8.563812155615105741612217814369165313487129645536001850276987e-02, 1.414147340733826800884683119379170594092606174915755283496153e-01, -5.658645863072738145681787657843320646815509410635114234947902e-02, -1.147311707107443752394144019458942779715665489230169950201022e-01, 4.309589543304764288137871223616030624246568683595408792078602e-02, 8.720439826203975011910714164154456762073786124233088471855868e-02, -3.660510340287429567372071039506772372567938710943432838908247e-02, -6.176620870841315993604736705613246241897497782373337911398117e-02, 3.198987753153780630818381136366859026137035450576631134176875e-02, 4.005498110511594820952087086241114309038577379366732959648548e-02, -2.689149388089451438550851767715967313417890393287236700072071e-02, -2.311413402054931680856913553585621248925303865540203357180768e-02, 2.090464525565524340215982365351342094670261491526831672682244e-02, 1.129049727868596484270081487761544232851115891449843967151657e-02, -1.470188206539868213708986402816605045648481224662435114088245e-02, -4.131306656031089274123231103326745723188134548520938157995702e-03, 9.214785032197180512031534870181734003522861645903894504302286e-03, 5.625715748403532005741565594881148757066703437214522101740941e-04, -5.071314509218348093935061417505663002006821323958752649640329e-03, 7.169821821064019257784165364894915621888541496773370435889585e-04, 2.400697781890973183892306914082592143984140550210130139535193e-03, -8.448626665537775009068937851465856973251363010924003314643612e-04, -9.424614077227377964015942271780098283910230639908018778588910e-04, 5.810759750532863662020321063678196633409555706981476723988312e-04, 2.817639250380670746018048967535608190123523180612961062603672e-04, -3.031020460726611993600629020329784682496477106470427787747855e-04, -4.555682696668420274688683005987764360677217149927938344795290e-05, 1.262043350166170705382346537131817701361522387904917335958705e-04, -1.155409103833717192628479047983460953381959342642374175822863e-05, -4.175141648540397797296325065775711309197411926289412468280801e-05, 1.334176149921350382547503457286060922218070031330137601427324e-05, 1.037359184045599795632258335010065103524959844966094870217687e-05, -6.456730428469619160379910439617575420986972394137121953806236e-06, -1.550844350118602575853380148525912999401292473185534395740371e-06, 2.149960269939665207789548199790770596890252405076394885606038e-06, -8.487087586072593071869805266089426629606479876982221840833098e-08, -5.187733738874144426008474683378542368066310000602823096009187e-07, 1.396377545508355481227961581059961184519872502493462010264633e-07, 8.400351046895965526933587176781279507953080669259318722910523e-08, -4.884757937459286762082185411608763964041010392101914854918157e-08, -5.424274800287298511126684174854414928447521710664476410973981e-09, 1.034704539274858480924046490952803937328239537222908159451039e-08, -1.436329487795135706854539856979275911183628476521636251660849e-09, -1.349197753983448821850381770889786301246741304307934955997111e-09, 5.261132557357598494535766638772624572100332209198979659077082e-10, 6.732336490189308685740626964182623159759767536724844030164551e-11, -8.278256522538134727330692938158991115335384611795874767521731e-11, 1.101692934599454551150832622160224231280195362919498540913658e-11, 6.291537317039508581580913620859140835852886308989584198166174e-12, -2.484789237563642857043361214502760723611468591833262675852242e-12, 2.626496504065252070488282876470525379851429538389481576454618e-14, 1.808661236274530582267084846343959377085922019067808145635263e-13, -4.249817819571463006966616371554206572863122562744916796556474e-14, -4.563397162127373109101691643047923747796563449194075621854491e-16, 2.045099676788988907802272564402310095398641092819367167252952e-15, -4.405307042483461342449027139838301611006835285455050155842865e-16, 4.304596839558790016251867477122791508849697688058169053134463e-17, -1.716152451088744188732404281737964277713026087224248235541071e-18})</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelet_data.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/wavelet__data_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="innards_8impl_8h" name="innards.impl.h" local="yes" imported="no">sopt/wavelets/innards.impl.h</includes>
    <class kind="struct">sopt::wavelets::WaveletData</class>
    <class kind="struct">sopt::wavelets::WaveletData::DirectFilter</class>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
    <member kind="function">
      <type>const WaveletData &amp;</type>
      <name>daubechies_data</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>af4b021fa0322242bb199585c12803a0e</anchor>
      <arglist>(t_uint)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelets.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/wavelets/</path>
    <filename>http://astro-informatics.github.io/sopt/wavelets_2wavelets_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="direct_8h" name="direct.h" local="yes" imported="no">sopt/wavelets/direct.h</includes>
    <includes id="indirect_8h" name="indirect.h" local="yes" imported="no">sopt/wavelets/indirect.h</includes>
    <includes id="wavelet__data_8h" name="wavelet_data.h" local="yes" imported="no">sopt/wavelets/wavelet_data.h</includes>
    <class kind="class">sopt::wavelets::Wavelet</class>
    <namespace>sopt</namespace>
    <namespace>sopt::wavelets</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_WAVELET_MACRO_MULTIPLE</name>
      <anchorfile>wavelets_2wavelets_8h.html</anchorfile>
      <anchor>a756d64552c95c271c3bcaa6795623d6d</anchor>
      <arglist>(NAME)</arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_WAVELET_MACRO_EQUAL_SIZE</name>
      <anchorfile>wavelets_2wavelets_8h.html</anchorfile>
      <anchor>ad0e03b06d9d8f52f176825dae6f5deee</anchor>
      <arglist>(A, B)</arglist>
    </member>
    <member kind="function">
      <type>Wavelet</type>
      <name>factory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a65aedf4b737bb07c94642b42fe99bfab</anchor>
      <arglist>(std::string name=&quot;DB1&quot;, t_uint nlevels=1)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wavelets.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/wavelets_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="sara_8h" name="sara.h" local="yes" imported="no">sopt/wavelets/sara.h</includes>
    <includes id="wavelets_2wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets/wavelets.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::details</namespace>
    <namespace>sopt::utilities</namespace>
    <member kind="define">
      <type>#define</type>
      <name>SOPT_WAVELET_MACRO</name>
      <anchorfile>wavelets_8h.html</anchorfile>
      <anchor>a6311571f34665649f18432909d7adedf</anchor>
      <arglist>(NAME)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_basis_coefficients</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>aa690cbbff2973dae8e221bb19cf332cd</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint basis_index, const t_uint size)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_levels_1d</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>abe7ef9c993cc849d157658b7d0d9d63a</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint size)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_levels</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>ae362dbe5fcf8ca55344a1533c5f1c0af</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_low_high_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a9f44047b4c3854813cc5e83a6eb6273e</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_high_high_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>ae5cc489dc715100095239589273d58b4</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_high_low_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>aa259ba9a268fbd1019e24fd5df69458e</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_low_low_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a39d2d28fadb120962c1bfb9ca9009b20</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_high_pass_1d</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a4f4b5626396dbc7fba8c06d64be6f7f4</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint size)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a43b77806f4ddf6e970dbb6b03613e39f</anchor>
      <arglist>(wavelets::Wavelet const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5e3985419d8cc35852bff69d403aef8a</anchor>
      <arglist>(wavelets::SARA const &amp;sara)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a2d9a54108659a468d1a4c2177d7a88b0</anchor>
      <arglist>(wavelets::Wavelet const &amp;wavelet, t_uint rows, t_uint cols=1)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a9c445e577476358820c5cef07f4e3998</anchor>
      <arglist>(wavelets::SARA const &amp;sara, t_uint rows, t_uint cols=1)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wrapper.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/sopt/</path>
    <filename>http://astro-informatics.github.io/sopt/wrapper_8h.html</filename>
    <includes id="exception_8h" name="exception.h" local="yes" imported="no">sopt/exception.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">sopt::details::AppliedFunction</class>
    <class kind="class">sopt::details::WrapFunction</class>
    <class kind="struct">Eigen::internal::traits&lt; sopt::details::AppliedFunction&lt; FUNCTION, VECTOR &gt; &gt;</class>
    <namespace>sopt</namespace>
    <namespace>sopt::details</namespace>
    <namespace>Eigen</namespace>
    <namespace>Eigen::internal</namespace>
    <member kind="function">
      <type>WrapFunction&lt; VECTOR &gt;</type>
      <name>wrap</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1details.html</anchorfile>
      <anchor>aa242c492d8954838a773f75c5a274729</anchor>
      <arglist>(OperatorFunction&lt; VECTOR &gt; const &amp;func, std::array&lt; t_int, 3 &gt; sizes={{1, 1, 0}})</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>bisection_method.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/bisection__method_8cc.html</filename>
    <includes id="bisection__method_8h" name="bisection_method.h" local="yes" imported="no">sopt/bisection_method.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>Scalar</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>aa0bfbe32b639db5c015dd41a0ac7ca35</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>a150b8eda2681eca0377a440541891747</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>t_Matrix</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>af5108e9a04c373219bb09b4d5dd53451</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>a0ea0adada48395ef54dc0b3cbd439ca4</anchor>
      <arglist>(&quot;Bisection x^3&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>aa0bef7e8f0232e584fe27a2d4c20acb7</anchor>
      <arglist>(&quot;Bisection f(x) = x&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>a86ef609c7c477c4957ca678d37ea72be</anchor>
      <arglist>(&quot;Bisection exp()&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>const Scalar</type>
      <name>a</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>a6d7237bd6650f7fc770cd55be22e4245</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const Scalar</type>
      <name>b</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>af7e17cd5ee7bef04f22c8e26709dd6e2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const Scalar</type>
      <name>tol</name>
      <anchorfile>bisection__method_8cc.html</anchorfile>
      <anchor>a871c6485151c4b58dcfcacee7fbec4cc</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chained_operators.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/chained__operators_8cc.html</filename>
    <includes id="chained__operators_8h" name="chained_operators.h" local="yes" imported="no">sopt/chained_operators.h</includes>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>chained__operators_8cc.html</anchorfile>
      <anchor>ae205f4bc3b6135ef1d7620e0e563b6d2</anchor>
      <arglist>(&quot;Linear Transforms&quot;, &quot;[ops]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>common_catch_main.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/common__catch__main_8cc.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <member kind="define">
      <type>#define</type>
      <name>CATCH_CONFIG_RUNNER</name>
      <anchorfile>common__catch__main_8cc.html</anchorfile>
      <anchor>a34b4c3eca7342fbc4cba090d02139902</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; std::mt19937_64 &gt;</type>
      <name>mersenne</name>
      <anchorfile>common__catch__main_8cc.html</anchorfile>
      <anchor>afd7b13def75c5d7feb77ac1ea2df5d0b</anchor>
      <arglist>(new std::mt19937_64(0))</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>common__catch__main_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>common_mpi_catch_main.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/common__mpi__catch__main_8cc.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="session_8h" name="session.h" local="yes" imported="no">sopt/mpi/session.h</includes>
    <member kind="define">
      <type>#define</type>
      <name>CATCH_CONFIG_RUNNER</name>
      <anchorfile>common__mpi__catch__main_8cc.html</anchorfile>
      <anchor>a34b4c3eca7342fbc4cba090d02139902</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; std::mt19937_64 &gt;</type>
      <name>mersenne</name>
      <anchorfile>common__mpi__catch__main_8cc.html</anchorfile>
      <anchor>afd7b13def75c5d7feb77ac1ea2df5d0b</anchor>
      <arglist>(new std::mt19937_64(0))</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>common__mpi__catch__main_8cc.html</anchorfile>
      <anchor>a217dbf8b442f20279ea00b898af96f52</anchor>
      <arglist>(int argc, const char **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>cppflow_model.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/cppflow__model_8cc.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="cppflow__utils_8h" name="cppflow_utils.h" local="yes" imported="no">sopt/cppflow_utils.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="typedef">
      <type>double</type>
      <name>Scalar</name>
      <anchorfile>cppflow__model_8cc.html</anchorfile>
      <anchor>a8c2981f3f834be9448a6ab06c28748eb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Image&lt; Scalar &gt;</type>
      <name>Image</name>
      <anchorfile>cppflow__model_8cc.html</anchorfile>
      <anchor>aeeca20f5186519056cf53849afb07e6e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>cppflow__model_8cc.html</anchorfile>
      <anchor>af13222888aa268274065619978a61fb6</anchor>
      <arglist>(&quot;Cppflow Model&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>credible_region.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/credible__region_8cc.html</filename>
    <includes id="credible__region_8h" name="credible_region.h" local="yes" imported="no">sopt/credible_region.h</includes>
    <includes id="objective__functions_8h" name="objective_functions.h" local="yes" imported="no">sopt/objective_functions.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="typedef">
      <type>t_complex</type>
      <name>Scalar</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a2347294fdd41052ca5fcf094e671f436</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a90b7f369945ab869d4b0dcc03b7475fc</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Image&lt; Scalar &gt;</type>
      <name>t_Image</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a428908316d6c85e77d127ec366f99b47</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a760c50325549768df8b34a296c41ae72</anchor>
      <arglist>(&quot;calculating gamma&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a239998c148b64741898264fe7869a0de</anchor>
      <arglist>(&quot;caculating upper and lower interval&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>ae26c411185aa0cba06afde1c640df39e</anchor>
      <arglist>(&quot;calculating upper and lower interval grid&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a68e39f9604867b18f1282e4d2db84805</anchor>
      <arglist>(&quot;calculating upper and lower interval grid non const&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>rows</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a1cc6c6d663c5f0c6cbd63b69ca306721</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>cols</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a4f8d1cebdd1d0572b0f5ff58464b9216</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>N</name>
      <anchorfile>credible__region_8cc.html</anchorfile>
      <anchor>a63ad592277b72fa5b576bf01e78554f4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>forward_backward.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/forward__backward_8cc.html</filename>
    <includes id="imaging__forward__backward_8h" name="imaging_forward_backward.h" local="yes" imported="no">sopt/imaging_forward_backward.h</includes>
    <includes id="l1__g__proximal_8h" name="l1_g_proximal.h" local="yes" imported="no">sopt/l1_g_proximal.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <class kind="struct">is_imaging_proximal_ref</class>
    <class kind="struct">is_l1_g_proximal_ref</class>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>Scalar</name>
      <anchorfile>forward__backward_8cc.html</anchorfile>
      <anchor>aa0bfbe32b639db5c015dd41a0ac7ca35</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>forward__backward_8cc.html</anchorfile>
      <anchor>a150b8eda2681eca0377a440541891747</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>t_real</name>
      <anchorfile>forward__backward_8cc.html</anchorfile>
      <anchor>adf3dc3fe16f041e337211cca9c8882dc</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>sopt::t_int</type>
      <name>random_integer</name>
      <anchorfile>forward__backward_8cc.html</anchorfile>
      <anchor>a2b78fa46a1e414e56828982c20223ced</anchor>
      <arglist>(sopt::t_int min, sopt::t_int max)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>forward__backward_8cc.html</anchorfile>
      <anchor>ad57407825de1a3d93ef7549398c2fa59</anchor>
      <arglist>(&quot;Forward Backward with ||x - x0||_2^2 function&quot;, &quot;[fb]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>forward__backward_8cc.html</anchorfile>
      <anchor>a06053648147488553cfd8aac524746a3</anchor>
      <arglist>(&quot;Check type returned on setting variables&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>N</name>
      <anchorfile>forward__backward_8cc.html</anchorfile>
      <anchor>a61a80266d367e479ef40417f4f681bea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gradient_operator.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/gradient__operator_8cc.html</filename>
    <includes id="gradient__operator_8h" name="gradient_operator.h" local="yes" imported="no">sopt/gradient_operator.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>gradient__operator_8cc.html</anchorfile>
      <anchor>a66593d327e51e29c6e4acf7de42cbc40</anchor>
      <arglist>(&quot;Gradient Operator&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>linear_transform.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/linear__transform_8cc.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>linear__transform_8cc.html</anchorfile>
      <anchor>ae205f4bc3b6135ef1d7620e0e563b6d2</anchor>
      <arglist>(&quot;Linear Transforms&quot;, &quot;[ops]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>linear__transform_8cc.html</anchorfile>
      <anchor>a77e34a9a75a2c76d175db80104202154</anchor>
      <arglist>(&quot;Array of Linear transforms&quot;, &quot;[ops]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>maths.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/maths_8cc.html</filename>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>maths_8cc.html</anchorfile>
      <anchor>aa14f39932a2f11816e5b41d1ac746e69</anchor>
      <arglist>(&quot;Projector on positive quadrant&quot;, &quot;[utility][project]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>maths_8cc.html</anchorfile>
      <anchor>a0f5665d04f5a461c51acf7a2bbd36602</anchor>
      <arglist>(&quot;Weighted l1 norm&quot;, &quot;[utility][l1]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>maths_8cc.html</anchorfile>
      <anchor>a762d6de3cda8f20da404519ecbdde569</anchor>
      <arglist>(&quot;Soft threshhold&quot;, &quot;[utility][threshhold]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>maths_8cc.html</anchorfile>
      <anchor>a3399d2b5e42f16e9f13a134b4b217ded</anchor>
      <arglist>(&quot;Sampling&quot;, &quot;[utility][sampling]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>maths_8cc.html</anchorfile>
      <anchor>ae3e056f66c8a48ad73001e2aa3d81019</anchor>
      <arglist>(&quot;Relative variation&quot;, &quot;[utility][convergence]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>maths_8cc.html</anchorfile>
      <anchor>afc453059a75a7c0fdca3deb00cafd468</anchor>
      <arglist>(&quot;Scalar elative variation&quot;, &quot;[utility][convergence]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>maths_8cc.html</anchorfile>
      <anchor>ae65d734badd87218aeccc877d26e81e7</anchor>
      <arglist>(&quot;Standard deviation&quot;, &quot;[utility]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>mpi_proximals.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/mpi__proximals_8cc.html</filename>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>mpi__proximals_8cc.html</anchorfile>
      <anchor>a4f46a7dc56bba9e4b244262075acad1d</anchor>
      <arglist>(&quot;Parallel Euclidian norm&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>mpi__proximals_8cc.html</anchorfile>
      <anchor>af175dab6df2dee415120fa91952dd1ea</anchor>
      <arglist>(&quot;Parallel L2 ball&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>mpi__proximals_8cc.html</anchorfile>
      <anchor>aadec51ee61603406a465c626142ea85b</anchor>
      <arglist>(&quot;Parallel WeightedL2Ball&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>mpi_session.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/mpi__session_8cc.html</filename>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="session_8h" name="session.h" local="yes" imported="no">sopt/mpi/session.h</includes>
    <member kind="define">
      <type>#define</type>
      <name>CATCH_CONFIG_RUNNER</name>
      <anchorfile>mpi__session_8cc.html</anchorfile>
      <anchor>a34b4c3eca7342fbc4cba090d02139902</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>mpi__session_8cc.html</anchorfile>
      <anchor>af99d601fcd464667b8a1df1f1954a879</anchor>
      <arglist>(&quot;Create/delete session&quot;)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>mpi__session_8cc.html</anchorfile>
      <anchor>a217dbf8b442f20279ea00b898af96f52</anchor>
      <arglist>(int argc, const char **argv)</arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; char const * &gt;</type>
      <name>cargs</name>
      <anchorfile>mpi__session_8cc.html</anchorfile>
      <anchor>a8a6282f51259c130e01e0e59e8201cf7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>mpi_wavelets.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/mpi__wavelets_8cc.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>mpi__wavelets_8cc.html</anchorfile>
      <anchor>a81238bde1e31d33921ffb3e7d79ee62d</anchor>
      <arglist>(&quot;Wavelet transform innards with integer data&quot;, &quot;[wavelet]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>padmm.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/padmm_8cc.html</filename>
    <includes id="imaging__padmm_8h" name="imaging_padmm.h" local="yes" imported="no">sopt/imaging_padmm.h</includes>
    <includes id="padmm_8h" name="padmm.h" local="yes" imported="no">sopt/padmm.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="struct">is_imaging_proximal_ref</class>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>Scalar</name>
      <anchorfile>padmm_8cc.html</anchorfile>
      <anchor>aa0bfbe32b639db5c015dd41a0ac7ca35</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>padmm_8cc.html</anchorfile>
      <anchor>a150b8eda2681eca0377a440541891747</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>t_Matrix</name>
      <anchorfile>padmm_8cc.html</anchorfile>
      <anchor>af5108e9a04c373219bb09b4d5dd53451</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>sopt::t_int</type>
      <name>random_integer</name>
      <anchorfile>padmm_8cc.html</anchorfile>
      <anchor>a2b78fa46a1e414e56828982c20223ced</anchor>
      <arglist>(sopt::t_int min, sopt::t_int max)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>padmm_8cc.html</anchorfile>
      <anchor>ad631048561906101fea7537e7c3e410b</anchor>
      <arglist>(&quot;Proximal ADMM with ||x - x0||_2 functions&quot;, &quot;[padmm][integration]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>padmm_8cc.html</anchorfile>
      <anchor>a06053648147488553cfd8aac524746a3</anchor>
      <arglist>(&quot;Check type returned on setting variables&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>N</name>
      <anchorfile>padmm_8cc.html</anchorfile>
      <anchor>a61a80266d367e479ef40417f4f681bea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>padmm_warm_start.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/padmm__warm__start_8cc.html</filename>
    <includes id="padmm_8h" name="padmm.h" local="yes" imported="no">sopt/padmm.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>Scalar</name>
      <anchorfile>padmm__warm__start_8cc.html</anchorfile>
      <anchor>aa0bfbe32b639db5c015dd41a0ac7ca35</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>padmm__warm__start_8cc.html</anchorfile>
      <anchor>a150b8eda2681eca0377a440541891747</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>t_Matrix</name>
      <anchorfile>padmm__warm__start_8cc.html</anchorfile>
      <anchor>af5108e9a04c373219bb09b4d5dd53451</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SCENARIO</name>
      <anchorfile>padmm__warm__start_8cc.html</anchorfile>
      <anchor>a42d6ee4bff0802f8936127fb5a950150</anchor>
      <arglist>(&quot;ProximalADMM with warm start&quot;, &quot;[padmm][integration]&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>N</name>
      <anchorfile>padmm__warm__start_8cc.html</anchorfile>
      <anchor>a61a80266d367e479ef40417f4f681bea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>primal_dual.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/primal__dual_8cc.html</filename>
    <includes id="imaging__primal__dual_8h" name="imaging_primal_dual.h" local="yes" imported="no">sopt/imaging_primal_dual.h</includes>
    <includes id="primal__dual_8h" name="primal_dual.h" local="yes" imported="no">sopt/primal_dual.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="struct">is_primal_dual_ref</class>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>Scalar</name>
      <anchorfile>primal__dual_8cc.html</anchorfile>
      <anchor>aa0bfbe32b639db5c015dd41a0ac7ca35</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>primal__dual_8cc.html</anchorfile>
      <anchor>a150b8eda2681eca0377a440541891747</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>t_Matrix</name>
      <anchorfile>primal__dual_8cc.html</anchorfile>
      <anchor>af5108e9a04c373219bb09b4d5dd53451</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>primal__dual_8cc.html</anchorfile>
      <anchor>aa16eb3fffa70bcc98d5c6d3100dfe065</anchor>
      <arglist>(&quot;Primal Dual Imaging&quot;, &quot;[primaldual]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>primal__dual_8cc.html</anchorfile>
      <anchor>a8345d5e28748fc0c3bc0b39cf4f00927</anchor>
      <arglist>(&quot;Primal Dual with 0.5 * ||x - x0||_2^2 function&quot;, &quot;[primaldual]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>primal__dual_8cc.html</anchorfile>
      <anchor>a06053648147488553cfd8aac524746a3</anchor>
      <arglist>(&quot;Check type returned on setting variables&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>N</name>
      <anchorfile>primal__dual_8cc.html</anchorfile>
      <anchor>a61a80266d367e479ef40417f4f681bea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>proximal.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/proximal_8cc.html</filename>
    <includes id="l1__proximal_8h" name="l1_proximal.h" local="yes" imported="no">sopt/l1_proximal.h</includes>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="function">
      <type>sopt::Matrix&lt; T &gt;</type>
      <name>concatenated_permutations</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>a417f78cb16efede71a70751cdb7ccabd</anchor>
      <arglist>(sopt::t_uint i, sopt::t_uint j)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>a17e783f30766e65bfc242fbcb73e0f86</anchor>
      <arglist>(&quot;L2Ball&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>aa6750aa1b179c1f2a97aa16161d308bc</anchor>
      <arglist>(&quot;WeightedL2Ball&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>a231e7e9d6b0db644f7dd4e0b35d6aa4e</anchor>
      <arglist>(&quot;Euclidian norm&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>a13634feef68a819910b0e3d80cb2142c</anchor>
      <arglist>(&quot;Translation&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>aec58979fff169e7ac3f750d9e25cd8e6</anchor>
      <arglist>(&quot;Tight-Frame L1 proximal&quot;, &quot;[l1][proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>a4a6647cf1a92d5c7847cc75ba2aff1fa</anchor>
      <arglist>(&quot;L1 proximal utilities&quot;, &quot;[l1][utilities]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>proximal_8cc.html</anchorfile>
      <anchor>a8abcd04d11b368cb1d2c9331f82d4adc</anchor>
      <arglist>(&quot;L1 proximal&quot;, &quot;[l1][proximal]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>sdmm.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/sdmm_8cc.html</filename>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="sdmm_8h" name="sdmm.h" local="yes" imported="no">sopt/sdmm.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <class kind="class">IntrospectSDMM</class>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>Scalar</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>aa0bfbe32b639db5c015dd41a0ac7ca35</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>a150b8eda2681eca0377a440541891747</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>t_Matrix</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>af5108e9a04c373219bb09b4d5dd53451</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>sopt::t_int</type>
      <name>random_integer</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>a2b78fa46a1e414e56828982c20223ced</anchor>
      <arglist>(sopt::t_int min, sopt::t_int max)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>ad2c7e90cbadc2a5a0e6f1607f180352a</anchor>
      <arglist>(&quot;Proximal translation&quot;, &quot;[proximal]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>a38aee3800fa9ff0fecd216ac4b65cb10</anchor>
      <arglist>(&quot;Introspect SDMM with L_i = Identity and Euclidian objectives&quot;, &quot;[sdmm]&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>a371496afe947fe7ec64eb62f88fc0a10</anchor>
      <arglist>(&quot;SDMM with ||x - x0||_2 functions&quot;, &quot;[sdmm][integration]&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>N</name>
      <anchorfile>sdmm_8cc.html</anchorfile>
      <anchor>a61a80266d367e479ef40417f4f681bea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>sdmm_warm_start.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/sdmm__warm__start_8cc.html</filename>
    <includes id="proximal_8h" name="proximal.h" local="yes" imported="no">sopt/proximal.h</includes>
    <includes id="sdmm_8h" name="sdmm.h" local="yes" imported="no">sopt/sdmm.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <member kind="typedef">
      <type>sopt::t_real</type>
      <name>Scalar</name>
      <anchorfile>sdmm__warm__start_8cc.html</anchorfile>
      <anchor>aa0bfbe32b639db5c015dd41a0ac7ca35</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>sdmm__warm__start_8cc.html</anchorfile>
      <anchor>a150b8eda2681eca0377a440541891747</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>t_Matrix</name>
      <anchorfile>sdmm__warm__start_8cc.html</anchorfile>
      <anchor>af5108e9a04c373219bb09b4d5dd53451</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SCENARIO</name>
      <anchorfile>sdmm__warm__start_8cc.html</anchorfile>
      <anchor>a8e51b571c2dc0ad2005a53cf19e57644</anchor>
      <arglist>(&quot;SDMM with warm start&quot;, &quot;[sdmm][integration]&quot;)</arglist>
    </member>
    <member kind="variable">
      <type>const auto</type>
      <name>N</name>
      <anchorfile>sdmm__warm__start_8cc.html</anchorfile>
      <anchor>a61a80266d367e479ef40417f4f681bea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>serial_vs_parallel_padmm.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/serial__vs__parallel__padmm_8cc.html</filename>
    <includes id="imaging__padmm_8h" name="imaging_padmm.h" local="yes" imported="no">sopt/imaging_padmm.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="communicator_8h" name="communicator.h" local="yes" imported="no">sopt/mpi/communicator.h</includes>
    <includes id="mpi_2utilities_8h" name="utilities.h" local="yes" imported="no">sopt/mpi/utilities.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="wavelets_8h" name="wavelets.h" local="yes" imported="no">sopt/wavelets.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>serial__vs__parallel__padmm_8cc.html</anchorfile>
      <anchor>a922743020198d60a7b037f8d17066a83</anchor>
      <arglist>(&quot;Parallel vs serial inpainting&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tf_inpainting.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tf__inpainting_8cc.html</filename>
    <includes id="imaging__forward__backward_8h" name="imaging_forward_backward.h" local="yes" imported="no">sopt/imaging_forward_backward.h</includes>
    <includes id="tf__g__proximal_8h" name="tf_g_proximal.h" local="yes" imported="no">sopt/tf_g_proximal.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="maths_8h" name="maths.h" local="yes" imported="no">sopt/maths.h</includes>
    <includes id="relative__variation_8h" name="relative_variation.h" local="yes" imported="no">sopt/relative_variation.h</includes>
    <includes id="sampling_8h" name="sampling.h" local="yes" imported="no">sopt/sampling.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <member kind="typedef">
      <type>double</type>
      <name>Scalar</name>
      <anchorfile>tf__inpainting_8cc.html</anchorfile>
      <anchor>a8c2981f3f834be9448a6ab06c28748eb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Vector&lt; Scalar &gt;</type>
      <name>Vector</name>
      <anchorfile>tf__inpainting_8cc.html</anchorfile>
      <anchor>a47c194cae73625ab3a13b62e4234f46f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Matrix&lt; Scalar &gt;</type>
      <name>Matrix</name>
      <anchorfile>tf__inpainting_8cc.html</anchorfile>
      <anchor>ab86a00c212fb2233871e057014ded6a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sopt::Image&lt; Scalar &gt;</type>
      <name>Image</name>
      <anchorfile>tf__inpainting_8cc.html</anchorfile>
      <anchor>aeeca20f5186519056cf53849afb07e6e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>tf__inpainting_8cc.html</anchorfile>
      <anchor>a4e85c74adb906d5a3d0a1c2be49ebc78</anchor>
      <arglist>(&quot;Inpainting&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>wrapper.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tests/</path>
    <filename>http://astro-informatics.github.io/sopt/wrapper_8cc.html</filename>
    <includes id="wrapper_8h" name="wrapper.h" local="yes" imported="no">sopt/wrapper.h</includes>
    <member kind="function">
      <type></type>
      <name>TEST_CASE</name>
      <anchorfile>wrapper_8cc.html</anchorfile>
      <anchor>a44236a45ee2ebbd1e8cd3293d8b9f2f2</anchor>
      <arglist>(&quot;Function wrappers&quot;, &quot;[utility]&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>cdata.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/tools_for_tests/</path>
    <filename>http://astro-informatics.github.io/sopt/cdata_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <class kind="struct">sopt::CData</class>
    <namespace>sopt</namespace>
    <member kind="function">
      <type>void</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a1f816b885c3c1e6e59760df6436c8111</anchor>
      <arglist>(void *out, void *in, void **data)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>adjoint_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a44810fe3a30c81d0c9c5c91dd60011f8</anchor>
      <arglist>(void *out, void *in, void **data)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>copy_tiff.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tools_for_tests/</path>
    <filename>http://astro-informatics.github.io/sopt/copy__tiff_8cc.html</filename>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <includes id="logging_8h" name="logging.h" local="yes" imported="no">sopt/logging.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>copy__tiff_8cc.html</anchorfile>
      <anchor>a790aa8b99fa3d90918361b8936af0b14</anchor>
      <arglist>(int argc, char const **argv)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>directories.in.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/tools_for_tests/</path>
    <filename>http://astro-informatics.github.io/sopt/directories_8in_8h.html</filename>
    <namespace>sopt</namespace>
    <namespace>sopt::notinstalled</namespace>
    <member kind="function">
      <type>std::string</type>
      <name>data_directory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a1fcff7fb7b9de6604362ab009611d37f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>output_directory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a41591b69e6406ef3a36ded99be530efd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>models_directory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a2fa3d08c375b7e60e38382025a454314</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>inpainting.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/tools_for_tests/</path>
    <filename>http://astro-informatics.github.io/sopt/inpainting_8h.html</filename>
    <includes id="linear__transform_8h" name="linear_transform.h" local="yes" imported="no">sopt/linear_transform.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>target</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a83a82628fe55e720accd252a72c7337c</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; T &gt;::type</type>
      <name>sigma</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad7fbfa0f1f262d124020ccaf5e6cb573</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>dirty</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a52a813b13ba02590f41062b84996e0d5</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image, RANDOM &amp;mersenne)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; T &gt;::type</type>
      <name>epsilon</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a974f99e567f8ac05a0fe5e50fbfd215b</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tiffwrappers.cc</name>
    <path>/home/runner/work/sopt/sopt/cpp/tools_for_tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tiffwrappers_8cc.html</filename>
    <includes id="tiffwrappers_8h" name="tiffwrappers.h" local="yes" imported="no">tools_for_tests/tiffwrappers.h</includes>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <includes id="utilities_8h" name="utilities.h" local="yes" imported="no">sopt/utilities.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::notinstalled</namespace>
    <member kind="function">
      <type>Image</type>
      <name>read_standard_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a3008033a62397de1c2e272b6caab6648</anchor>
      <arglist>(std::string const &amp;name)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tiffwrappers.h</name>
    <path>/home/runner/work/sopt/sopt/cpp/tools_for_tests/</path>
    <filename>http://astro-informatics.github.io/sopt/tiffwrappers_8h.html</filename>
    <includes id="types_8h" name="types.h" local="yes" imported="no">sopt/types.h</includes>
    <namespace>sopt</namespace>
    <namespace>sopt::notinstalled</namespace>
    <member kind="function">
      <type>Image</type>
      <name>read_standard_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a3008033a62397de1c2e272b6caab6648</anchor>
      <arglist>(std::string const &amp;name)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::AppliedFunction</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1AppliedFunction.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename DERIVED::PlainObject</type>
      <name>PlainObject</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>a1c62d07a2fc580ae4ec8fa03330aeddb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename DERIVED::Index</type>
      <name>Index</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>afbeb92a0c96c09f6f0613c4fd5b03c2d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>AppliedFunction</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>acfbcbe5afb8b81844442e66695ebfecd</anchor>
      <arglist>(FUNCTION const &amp;func, DERIVED const &amp;x, Index rows)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>AppliedFunction</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>af43ebaa92f9daee738281359561eab8c</anchor>
      <arglist>(FUNCTION const &amp;func, DERIVED const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>AppliedFunction</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>a5236328c1b5f47342f023efae4897ef0</anchor>
      <arglist>(AppliedFunction const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>AppliedFunction</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>afcb875d868e56becc955495b0fd6df84</anchor>
      <arglist>(AppliedFunction &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>evalTo</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>a2b9902bfa528832e2ab56f7bc71ddd33</anchor>
      <arglist>(DESTINATION &amp;destination) const</arglist>
    </member>
    <member kind="function">
      <type>Index</type>
      <name>rows</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>af9e0609f365748812406fc18e4652675</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Index</type>
      <name>cols</name>
      <anchorfile>classsopt_1_1details_1_1AppliedFunction.html</anchorfile>
      <anchor>a86c33ea8cf97bf762ec224a4255480fe</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::L1::Breaker</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L1_1_1Breaker.html</filename>
    <member kind="typedef">
      <type>typename real_type&lt; SCALAR &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>aadd7640a9a05de59fef679fdf094da8e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Breaker</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>adb199fd4831597d20d1fef5d98540ab6</anchor>
      <arglist>(Real objective, Real tolerance=1e-8, bool do_two_cycle=true)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>a825f3421ca6c7b7f025e7a5f6dce852b</anchor>
      <arglist>(Real objective)</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>current</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>af743089a976216692dd4009017b72365</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>previous</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>a067777c429ce439bdc77e8f49488e9f9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>relative_variation</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>afe1b31707548cc125993b89da845f7b1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>two_cycle</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>a2c41dc5efe3913c458eecb72fd11393e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>converged</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>a25bff18090d2a4cf5cc400061e3bdd83</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>tolerance</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>a07d4862399e7c4b0a9f6ac8b89476141</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; SCALAR &gt;::Breaker &amp;</type>
      <name>tolerance</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1Breaker.html</anchorfile>
      <anchor>a960a1bce462b40123ebe72a6454f70f3</anchor>
      <arglist>(Real tol) const</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::CData</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1CData.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>Eigen::Matrix&lt; T, Eigen::Dynamic, 1 &gt;</type>
      <name>t_Vector</name>
      <anchorfile>structsopt_1_1CData.html</anchorfile>
      <anchor>ab08e1e0aff082fd9461ad0713fad9323</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_Vector::Index</type>
      <name>nin</name>
      <anchorfile>structsopt_1_1CData.html</anchorfile>
      <anchor>a7ba8f2d098d62af502e016d0194b372a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_Vector::Index</type>
      <name>nout</name>
      <anchorfile>structsopt_1_1CData.html</anchorfile>
      <anchor>aa41c3ea2da9c454bf31d984a57afedd1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const sopt::LinearTransform&lt; t_Vector &gt; &amp;</type>
      <name>transform</name>
      <anchorfile>structsopt_1_1CData.html</anchorfile>
      <anchor>a6d65fad3511a0215687481240f7b8a71</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>direct_calls</name>
      <anchorfile>structsopt_1_1CData.html</anchorfile>
      <anchor>ad09ae52d5cb87cc12e74df3289c5d454</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>adjoint_calls</name>
      <anchorfile>structsopt_1_1CData.html</anchorfile>
      <anchor>a7c0a7c60df7430422aeb7db54aabf3d4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::ConjugateGradient</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1ConjugateGradient.html</filename>
    <class kind="struct">sopt::ConjugateGradient::Diagnostic</class>
    <class kind="struct">sopt::ConjugateGradient::DiagnosticAndResult</class>
    <member kind="function">
      <type></type>
      <name>ConjugateGradient</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>a8773556e24e11ea926e9f6b9af1c71b8</anchor>
      <arglist>(t_uint itermax=std::numeric_limits&lt; t_uint &gt;::max(), t_real tolerance=1e-8)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ConjugateGradient</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>a4b3876b1b56c3256759c5a741803ddd8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>aece96e62a336cb2644d0bcc01bb1bff0</anchor>
      <arglist>(VECTOR &amp;x, Eigen::MatrixBase&lt; T1 &gt; const &amp;A, Eigen::MatrixBase&lt; T2 &gt; const &amp;b) const</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; not std::is_base_of&lt; Eigen::EigenBase&lt; T1 &gt;, T1 &gt;::value, Diagnostic &gt;::type</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>ac49c2b268495d5809a78a6f94b7fdfc6</anchor>
      <arglist>(VECTOR &amp;x, T1 const &amp;A, Eigen::MatrixBase&lt; T2 &gt; const &amp;b) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult&lt; typename T0::Scalar &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>af5cceb604393a7d5dcc090fcc76bc8bf</anchor>
      <arglist>(A_TYPE const &amp;A, Eigen::MatrixBase&lt; T0 &gt; const &amp;b) const</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>itermax</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>a8f8a54b6a66c410030fdd744e1ac7a81</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>itermax</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>a7f92f37a0edf95d86e8c8ebe77c73b25</anchor>
      <arglist>(t_uint const &amp;itermax)</arglist>
    </member>
    <member kind="function">
      <type>t_real</type>
      <name>tolerance</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>a3127aa8d57904dac88b71d71a343e725</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tolerance</name>
      <anchorfile>classsopt_1_1ConjugateGradient.html</anchorfile>
      <anchor>a2ef012547bf163c74a164cc3311f11e9</anchor>
      <arglist>(t_real const &amp;tolerance)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::details::DelayedProximalEnveloppeFunction</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename DERIVED::PlainObject</type>
      <name>PlainObject</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>a29e15676262668b6e00b147f74fef273</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename DERIVED::Index</type>
      <name>Index</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>a67d88b95c1a97d5d606efdca6059b4a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; typename DERIVED::Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>a4084c7ecff4316eb58d8c15a8b976cff</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DelayedProximalEnveloppeFunction</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>a169d0a9b7da83595212da29b408a953b</anchor>
      <arglist>(FUNCTION const &amp;func, DERIVED const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DelayedProximalEnveloppeFunction</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>abd29d2bbe783f9d7753be93bedb115ed</anchor>
      <arglist>(DelayedProximalEnveloppeFunction const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DelayedProximalEnveloppeFunction</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>a55b6fe5bf6f2f2f26bca2795d96474d7</anchor>
      <arglist>(DelayedProximalEnveloppeFunction &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>evalTo</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>af04cb0fb4f236b78df60ec1b98196563</anchor>
      <arglist>(DESTINATION &amp;destination) const</arglist>
    </member>
    <member kind="function">
      <type>Index</type>
      <name>rows</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>a9e6bbb8212eb80065a2b2a0ded6b5328</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Index</type>
      <name>cols</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFunction.html</anchorfile>
      <anchor>a133d35385cc424da0be3e796b92a0668</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::details::DelayedProximalFunction</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename DERIVED::PlainObject</type>
      <name>PlainObject</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>a5d95e12f74bc66b3d61c285a30fa22c6</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename DERIVED::Index</type>
      <name>Index</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>a76cd6f37192d4d7f4b515c60e142983a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; typename DERIVED::Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>ad469fa8699b4999cd56c7c6c0080bf54</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DelayedProximalFunction</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>adefc188941b5cfbd7d324030f01955f8</anchor>
      <arglist>(FUNCTION const &amp;func, Real const &amp;gamma, DERIVED const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DelayedProximalFunction</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>a60348ec219ac9f2ab1b271776d84d32a</anchor>
      <arglist>(DelayedProximalFunction const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DelayedProximalFunction</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>abc281bee76608832d4baef79f16a9ade</anchor>
      <arglist>(DelayedProximalFunction &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>evalTo</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>a1aa3f05ffbb1acfb335c83a01f9f639c</anchor>
      <arglist>(DESTINATION &amp;destination) const</arglist>
    </member>
    <member kind="function">
      <type>Index</type>
      <name>rows</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>a049be4e5d6e84f7013bb8788d740b334</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Index</type>
      <name>cols</name>
      <anchorfile>classsopt_1_1proximal_1_1details_1_1DelayedProximalFunction.html</anchorfile>
      <anchor>a6d30ecdd7a457c8326354b05095d58f9</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::details::HasValueType::Derived</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1details_1_1HasValueType_1_1Derived.html</filename>
    <base>sopt::details::HasValueType::Fallback</base>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ImagingPrimalDual::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ImagingPrimalDual_1_1Diagnostic.html</filename>
    <base>sopt::algorithm::PrimalDual::Diagnostic</base>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingPrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a70a2ef25889e05527ae3e2e899ee6170</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingPrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a60612577de054b15a2f620030c563eb1</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingPrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a70a2ef25889e05527ae3e2e899ee6170</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingPrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a60612577de054b15a2f620030c563eb1</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ProximalADMM::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ProximalADMM_1_1Diagnostic.html</filename>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>aa0dddba0ed8a408b6db1e0ef2d574e8e</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>aa680f3230e830dea32e6709c2596d5f0</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1algorithm_1_1ProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>aa5c9c93f55e44eb408714d3d98bdd387</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1algorithm_1_1ProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>a3315cf4a15c1d3af23efb1e530daa920</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_Vector</type>
      <name>residual</name>
      <anchorfile>structsopt_1_1algorithm_1_1ProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>ae952f971d08be8e337622c24fd0cbe4d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::SDMM::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1SDMM_1_1Diagnostic.html</filename>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1algorithm_1_1SDMM_1_1Diagnostic.html</anchorfile>
      <anchor>a58735221c007296a187675477c88440c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1algorithm_1_1SDMM_1_1Diagnostic.html</anchorfile>
      <anchor>acfb6fb0157f5782427f8e9d147f29b51</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>ConjugateGradient::Diagnostic</type>
      <name>cg_diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1SDMM_1_1Diagnostic.html</anchorfile>
      <anchor>a87355eabe5ef6860ef847be3f61fab5b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::TVPrimalDual::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1TVPrimalDual_1_1Diagnostic.html</filename>
    <base>sopt::algorithm::PrimalDual::Diagnostic</base>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1TVPrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a93b105093d55d721ba63dcb561b17d58</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1TVPrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a92c1047976f05fb54c6c20f56d5f7ae3</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ImagingForwardBackward::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ImagingForwardBackward_1_1Diagnostic.html</filename>
    <base>sopt::algorithm::ForwardBackward::Diagnostic</base>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>a869c7446493ed028f7169b5c1aff407c</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>af37e9ee0bfe43f171d5c1c523d04b416</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::PrimalDual::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1PrimalDual_1_1Diagnostic.html</filename>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1PrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>abf8c37da6d802882a8d514ac5a401804</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1PrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a65474a1525f99d54e53c6a98df5a26ca</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1algorithm_1_1PrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>aafd2cdaed3e0a8e22cf1dd973ca5437a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1algorithm_1_1PrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>ae0aef6a777dca9217efb8f82d758ad51</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_Vector</type>
      <name>residual</name>
      <anchorfile>structsopt_1_1algorithm_1_1PrimalDual_1_1Diagnostic.html</anchorfile>
      <anchor>a7a84589f1ffc6a46e1d9f06dc9760bb3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::proximal::L1::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1proximal_1_1L1_1_1Diagnostic.html</filename>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1proximal_1_1L1_1_1Diagnostic.html</anchorfile>
      <anchor>aafee2918e48b18a75a1003c23c8c79f4</anchor>
      <arglist>(t_uint niters=0, Real relative_variation=0, Real objective=0, bool good=false)</arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1proximal_1_1L1_1_1Diagnostic.html</anchorfile>
      <anchor>a02493df14b3f80a6fe8e85f558ed2fef</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Real</type>
      <name>relative_variation</name>
      <anchorfile>structsopt_1_1proximal_1_1L1_1_1Diagnostic.html</anchorfile>
      <anchor>ac8214487a4c75dcb1c116c6f9e905f29</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Real</type>
      <name>objective</name>
      <anchorfile>structsopt_1_1proximal_1_1L1_1_1Diagnostic.html</anchorfile>
      <anchor>a9ba8552c5d49581098dcaf0524b4244a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1proximal_1_1L1_1_1Diagnostic.html</anchorfile>
      <anchor>ac833272559efe39d4a43b32696ec289d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::ConjugateGradient::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1ConjugateGradient_1_1Diagnostic.html</filename>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1ConjugateGradient_1_1Diagnostic.html</anchorfile>
      <anchor>a13811f1c77bd5efd502b5e57f0384e0b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_real</type>
      <name>residual</name>
      <anchorfile>structsopt_1_1ConjugateGradient_1_1Diagnostic.html</anchorfile>
      <anchor>abd3db8afdf2f43575a1983d55af0201d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1ConjugateGradient_1_1Diagnostic.html</anchorfile>
      <anchor>aec9ab0a40da16eb74fcef2264d2facd3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ImagingProximalADMM::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ImagingProximalADMM_1_1Diagnostic.html</filename>
    <base>sopt::algorithm::ProximalADMM::Diagnostic</base>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>aa78cc8d93ef735e88af21c404a4c7380</anchor>
      <arglist>(t_uint niters=0u, bool good=false, typename proximal::L1&lt; Scalar &gt;::Diagnostic const &amp;l1diag=typename proximal::L1&lt; Scalar &gt;::Diagnostic())</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>a55abcd1b0a8ebc13ae5af079f5d4de13</anchor>
      <arglist>(t_uint niters, bool good, typename proximal::L1&lt; Scalar &gt;::Diagnostic const &amp;l1diag, t_Vector &amp;&amp;residual)</arglist>
    </member>
    <member kind="variable">
      <type>proximal::L1&lt; Scalar &gt;::Diagnostic</type>
      <name>l1_diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingProximalADMM_1_1Diagnostic.html</anchorfile>
      <anchor>a31e2019b33bc6ead42e5ef12bc769f5b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ForwardBackward::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ForwardBackward_1_1Diagnostic.html</filename>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>ab8baddd373080cecf7dabce6488a0e08</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1ForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>a2d54ba9f95d4fa86a6ef445189183525</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1algorithm_1_1ForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>a714c807aa4bb9c9b2c9aa40414d4e20d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1algorithm_1_1ForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>a34d420a479b015ea998c0f1da2e51a89</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_Vector</type>
      <name>residual</name>
      <anchorfile>structsopt_1_1algorithm_1_1ForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>a21851ff79aa79ee99f4e4452f70ef46e</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::L2ForwardBackward::Diagnostic</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1L2ForwardBackward_1_1Diagnostic.html</filename>
    <base>sopt::algorithm::ForwardBackward::Diagnostic</base>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1L2ForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>a0967141da9ad78af074291df889d032e</anchor>
      <arglist>(t_uint niters=0u, bool good=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Diagnostic</name>
      <anchorfile>structsopt_1_1algorithm_1_1L2ForwardBackward_1_1Diagnostic.html</anchorfile>
      <anchor>a4ad94b711201958f22390742b01e9f95</anchor>
      <arglist>(t_uint niters, bool good, t_Vector &amp;&amp;residual)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::ConjugateGradient::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1ConjugateGradient_1_1DiagnosticAndResult.html</filename>
    <templarg></templarg>
    <base>sopt::ConjugateGradient::Diagnostic</base>
    <member kind="variable">
      <type>Vector&lt; T &gt;</type>
      <name>result</name>
      <anchorfile>structsopt_1_1ConjugateGradient_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a66fef260423cc5e76cbdfc7f3bd5734a</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ForwardBackward::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ForwardBackward_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::ForwardBackward::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1ForwardBackward_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a6bebb7483ac2747d9adedbb21d06c7d0</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::SDMM::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1SDMM_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::SDMM::Diagnostic</base>
    <member kind="variable">
      <type>Vector&lt; SCALAR &gt;</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1SDMM_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>abedaded5d7f522c190356ef05b1ed3d4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ImagingPrimalDual::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ImagingPrimalDual_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::ImagingPrimalDual::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingPrimalDual_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a62cbf5984fc0c9d53d51fa5e43696a13</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ProximalADMM::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ProximalADMM_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::ProximalADMM::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1ProximalADMM_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a9e0c014425960579731d31ec46d40187</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::TVPrimalDual::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1TVPrimalDual_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::TVPrimalDual::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1TVPrimalDual_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a9aa9f3288307bf11a802cdca7cea7751</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::PowerMethod::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1PowerMethod_1_1DiagnosticAndResult.html</filename>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1algorithm_1_1PowerMethod_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a6454ddd8937fcff38845350af13cd436</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1algorithm_1_1PowerMethod_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a5f356a25c846bb4c8f6ab9aaa031c164</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Scalar</type>
      <name>magnitude</name>
      <anchorfile>structsopt_1_1algorithm_1_1PowerMethod_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>acef7d75639f61d6558c1a82ee07f0742</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Vector&lt; Scalar &gt;</type>
      <name>eigenvector</name>
      <anchorfile>structsopt_1_1algorithm_1_1PowerMethod_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>ac06d7ff0fee55a96eff4106693dbc8d3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::PrimalDual::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1PrimalDual_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::PrimalDual::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1PrimalDual_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a6e395c47993b7769c4d32f0aebfd1cd9</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>DummyAlgorithm::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structDummyAlgorithm_1_1DiagnosticAndResult.html</filename>
    <member kind="variable" static="yes">
      <type>static t_Vector</type>
      <name>x</name>
      <anchorfile>structDummyAlgorithm_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a2bf7fe3b6c83d0838f2792d289cc4241</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ImagingForwardBackward::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ImagingForwardBackward_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::ImagingForwardBackward::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingForwardBackward_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>abe9409cf0991268c5c12d7c020e2af51</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::proximal::L1::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1proximal_1_1L1_1_1DiagnosticAndResult.html</filename>
    <base>sopt::proximal::L1::Diagnostic</base>
    <member kind="variable">
      <type>Vector&lt; SCALAR &gt;</type>
      <name>proximal</name>
      <anchorfile>structsopt_1_1proximal_1_1L1_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>ab04ba16946820210e75365e61e989863</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::ImagingProximalADMM::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1ImagingProximalADMM_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::ImagingProximalADMM::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1ImagingProximalADMM_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>a5a071a3eadebc3013d766d18c72c29e3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::L2ForwardBackward::DiagnosticAndResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1L2ForwardBackward_1_1DiagnosticAndResult.html</filename>
    <base>sopt::algorithm::L2ForwardBackward::Diagnostic</base>
    <member kind="variable">
      <type>t_Vector</type>
      <name>x</name>
      <anchorfile>structsopt_1_1algorithm_1_1L2ForwardBackward_1_1DiagnosticAndResult.html</anchorfile>
      <anchor>adc24c64e4fc2a0248539dce46490d402</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::JointMAP::DiagnosticAndResultReg</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1JointMAP_1_1DiagnosticAndResultReg.html</filename>
    <member kind="variable">
      <type>t_real</type>
      <name>reg_term</name>
      <anchorfile>structsopt_1_1algorithm_1_1JointMAP_1_1DiagnosticAndResultReg.html</anchorfile>
      <anchor>a852871412d201891867438ecf9e0b178</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>reg_good</name>
      <anchorfile>structsopt_1_1algorithm_1_1JointMAP_1_1DiagnosticAndResultReg.html</anchorfile>
      <anchor>a3b775f3cf6a1597785e67e86f6431436</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>reg_niters</name>
      <anchorfile>structsopt_1_1algorithm_1_1JointMAP_1_1DiagnosticAndResultReg.html</anchorfile>
      <anchor>a9f939486853257e0ba769c7df1e66fc6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::wavelets::WaveletData::DirectFilter</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1wavelets_1_1WaveletData_1_1DirectFilter.html</filename>
    <member kind="variable">
      <type>t_vector</type>
      <name>low</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData_1_1DirectFilter.html</anchorfile>
      <anchor>a1a075f09c5c3e6ff8e1df22de1855920</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_vector</type>
      <name>high</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData_1_1DirectFilter.html</anchorfile>
      <anchor>aab76e2c0194364a8bc9bf1b2e641cb88</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>DummyAlgorithm</name>
    <filename>http://astro-informatics.github.io/sopt/structDummyAlgorithm.html</filename>
    <class kind="struct">DummyAlgorithm::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>t_real</type>
      <name>Scalar</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>a89839b63a08bfd3ce83db055aade39fc</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>aeef736e25169a392ac046c8f1f700749</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ConvergenceFunction&lt; Scalar &gt;</type>
      <name>t_IsConverged</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>ac334cd2f87afba5c2cb55660e4e8f28f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>aea01172b7abed2de74dd00864605e7d1</anchor>
      <arglist>(t_Vector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>a997b635f2f6613fad6528b4a202842da</anchor>
      <arglist>(DiagnosticAndResult const &amp;warm) const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static t_Vector</type>
      <name>reweightee</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>aa224f6b984bef060195d0306fd459190</anchor>
      <arglist>(DummyAlgorithm const &amp;, t_Vector const &amp;x)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>set_weights</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>ad8d1df340fc2b5a7acad8a9693e5bbb9</anchor>
      <arglist>(DummyAlgorithm &amp;, t_Vector const &amp;weights)</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static t_Vector</type>
      <name>weights</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>a4b8ef8d57adb0c79203ea7f6b474c15e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static int</type>
      <name>called_with_x</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>a0870fea967158b666d2366a4e84062f6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static int</type>
      <name>called_with_warm</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>a0456033c487b83518bb96cafa4e357dd</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static int</type>
      <name>called_reweightee</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>a51d5fc98b0c619cb27179f19505ef177</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static int</type>
      <name>called_weights</name>
      <anchorfile>structDummyAlgorithm.html</anchorfile>
      <anchor>a7a35ce223d5b8c94770c64d247c78c2f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::EuclidianNorm</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1EuclidianNorm.html</filename>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1EuclidianNorm.html</anchorfile>
      <anchor>a5304ad40396eb1527889b774a7f4e498</anchor>
      <arglist>(Vector&lt; typename T0::Scalar &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type const &amp;t, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>ProximalExpression&lt; EuclidianNorm, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1EuclidianNorm.html</anchorfile>
      <anchor>a5d75ec55acbcc1d116f87e3d0a8038a6</anchor>
      <arglist>(typename T0::Scalar const &amp;t, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::Exception</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1Exception.html</filename>
    <member kind="function">
      <type></type>
      <name>Exception</name>
      <anchorfile>classsopt_1_1Exception.html</anchorfile>
      <anchor>a368086838fc4b6b85e5435d27b1b648e</anchor>
      <arglist>(std::string const &amp;filename, size_t lineno)</arglist>
    </member>
    <member kind="function">
      <type>const char *</type>
      <name>what</name>
      <anchorfile>classsopt_1_1Exception.html</anchorfile>
      <anchor>aab8f65e53af98eae5f6493c0ee546ba8</anchor>
      <arglist>() const noexcept override</arglist>
    </member>
    <member kind="function">
      <type>Exception &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>classsopt_1_1Exception.html</anchorfile>
      <anchor>ad446280878cfa164e7d8c4d48384886d</anchor>
      <arglist>(OBJECT const &amp;object)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::string</type>
      <name>header</name>
      <anchorfile>classsopt_1_1Exception.html</anchorfile>
      <anchor>a17510f38b85e94c1cfb20794a120e4d8</anchor>
      <arglist>(std::string const &amp;name, std::string const &amp;filename, size_t lineno)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::details::HasValueType::Fallback</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1details_1_1HasValueType_1_1Fallback.html</filename>
    <class kind="struct">sopt::details::HasValueType::Fallback::value_type</class>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::L1::FistaMixing</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L1_1_1FistaMixing.html</filename>
    <member kind="typedef">
      <type>typename real_type&lt; SCALAR &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1FistaMixing.html</anchorfile>
      <anchor>a8dc3dbbe6e015b07d4171c667affb59a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FistaMixing</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1FistaMixing.html</anchorfile>
      <anchor>a076ea51478c1449de100880da31613f7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1FistaMixing.html</anchorfile>
      <anchor>a2b6683eae9287ea7838860084f5da7a4</anchor>
      <arglist>(Vector&lt; SCALAR &gt; &amp;previous, Eigen::MatrixBase&lt; T1 &gt; const &amp;unmixed, t_uint iter)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static Real</type>
      <name>next</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1FistaMixing.html</anchorfile>
      <anchor>a7b34cce30496dd214c093438647e64c8</anchor>
      <arglist>(Real t)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::ForwardBackward</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1ForwardBackward.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::ForwardBackward::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ForwardBackward::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>SCALAR</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a7f3a7b49b585fe0e2d0bcca1adae3f4e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>value_type</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a8609e35c90eccd296886177afa25c61b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a1eff61e02bfdda72cbb09b3ca89ef5ad</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a8e179c92b2f7c350d9ee3bdf2b9c7edc</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>LinearTransform&lt; t_Vector &gt;</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>aaa95cc7ccbbddac6bf905079875f3fdf</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; bool(const t_Vector &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>af84c3056f186a532ca262ed9233c697b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ProximalFunction&lt; Scalar &gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>abbcb952f644a8f41d3129a774bb0cddd</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename std::function&lt; void(t_Vector &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_Gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>aecfa1469aa8a0ccf5da71deec9a8c68e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ForwardBackward</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a5ea856a4532bc6cc861b49b272307078</anchor>
      <arglist>(t_Gradient const &amp;f_gradient, t_Proximal const &amp;g_proximal, Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ForwardBackward</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a05e2e99267735a28809c658a6fa08c03</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a90f3de727f33d36da28a033973c2841a</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a35774da7475dbd339b6176efc6d35efd</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a017010a81bffb91610020b569bab7f5d</anchor>
      <arglist>(beta, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a03831d551eb3226966b0833eeeaf6848</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a5993c55188e2008f3cfa01d1df62fd3f</anchor>
      <arglist>(fista, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a0eab3dd46b4505b46b538e62b306e135</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a31cc334868ac1114bd00da2e3ee8d2de</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>ae122e577d7bf063b4b48011bff0ba633</anchor>
      <arglist>(f_gradient, t_Gradient)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a09cdba171a07f3e201fdc3cbf9f4974b</anchor>
      <arglist>(g_proximal, t_Proximal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>f_gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>ad5ff963c11f8f31a2fb3802daf99d16b</anchor>
      <arglist>(t_Vector &amp;out, t_Vector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>g_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>aded1ee9c25417d1f0f5333e7c6b833b0</anchor>
      <arglist>(t_Vector &amp;out, Real gamma, t_Vector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>ForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a71cb1304377e1b7a0fde6c7b2b7696cd</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>af532fd15750cd8c504a88cc8fa6cfe90</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>aeaf225ee8c51663cd8139f7b55b419b1</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a865ce022ed10e89f0d7fdced5aa60a5a</anchor>
      <arglist>(t_Vector const &amp;x, t_Vector const &amp;residual) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a40bbe44d3eadbfc2cb9bb4ee612de92d</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a7c5b039da115cfbc518c62a3b5d6af69</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a7c44690dac19b49fdbb9cf101d34dc2a</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>ab61badb52152599b3a8ca6030f6ad429</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>af01e9814d02582e79cf61ddb7072d423</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a1724a96f76b3779cc34e272cbd9aa726</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a4c64180827488006cd1dd287a8d1e7d5</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>ForwardBackward &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a8be880cc3fba39cb51a45d7f65982630</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_Vector, t_Vector &gt;</type>
      <name>initial_guess</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>a9d44dc3f863101780a1e519491756f1d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::tuple&lt; t_Vector, t_Vector &gt;</type>
      <name>initial_guess</name>
      <anchorfile>classsopt_1_1algorithm_1_1ForwardBackward.html</anchorfile>
      <anchor>ad530665e3a4ccaab94cb3e04e45c7e6d</anchor>
      <arglist>(t_Vector const &amp;target, t_LinearTransform const &amp;phi, Real nu)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GProximal</name>
    <filename>http://astro-informatics.github.io/sopt/classGProximal.html</filename>
    <templarg></templarg>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>log_message</name>
      <anchorfile>classGProximal.html</anchorfile>
      <anchor>a2595aa6c505024a43c7e34cccfbe3cf1</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual t_Proximal</type>
      <name>proximal_function</name>
      <anchorfile>classGProximal.html</anchorfile>
      <anchor>a1b0355a5f21c7d002431218cb65290f2</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Real</type>
      <name>proximal_norm</name>
      <anchorfile>classGProximal.html</anchorfile>
      <anchor>a63f2ef76f413ceda6cc12a14055a7d63</anchor>
      <arglist>(t_Vector const &amp;x) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual const t_LinearTransform &amp;</type>
      <name>Psi</name>
      <anchorfile>classGProximal.html</anchorfile>
      <anchor>aa09fe88d13ad97c15487b4f7894431cd</anchor>
      <arglist>() const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::has_value_type</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1has__value__type.html</filename>
    <templarg></templarg>
    <templarg></templarg>
  </compound>
  <compound kind="class">
    <name>sopt::details::has_value_type&lt; T, false &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1has__value__type_3_01T_00_01false_01_4.html</filename>
    <templarg></templarg>
  </compound>
  <compound kind="class">
    <name>sopt::details::has_value_type&lt; T, true &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1has__value__type_3_01T_00_01true_01_4.html</filename>
    <templarg></templarg>
  </compound>
  <compound kind="struct">
    <name>sopt::details::HasValueType</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1details_1_1HasValueType.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <class kind="struct">sopt::details::HasValueType::Derived</class>
    <class kind="struct">sopt::details::HasValueType::Fallback</class>
    <member kind="typedef">
      <type>char[1]</type>
      <name>Have</name>
      <anchorfile>structsopt_1_1details_1_1HasValueType.html</anchorfile>
      <anchor>a91b3c444ea1587572e61f7d66e6e0001</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>char[2]</type>
      <name>HaveNot</name>
      <anchorfile>structsopt_1_1details_1_1HasValueType.html</anchorfile>
      <anchor>aa68cd5507073731b86725d4e21c1bf25</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" static="yes">
      <type>static Have &amp;</type>
      <name>test</name>
      <anchorfile>structsopt_1_1details_1_1HasValueType.html</anchorfile>
      <anchor>a556962fc020b7545eb99d8aaa4fdfce0</anchor>
      <arglist>(typename U::value_type *)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static HaveNot &amp;</type>
      <name>test</name>
      <anchorfile>structsopt_1_1details_1_1HasValueType.html</anchorfile>
      <anchor>aaef0b3931cdd7bbe1e4ced15c1258783</anchor>
      <arglist>(U *)</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static constexpr bool</type>
      <name>value</name>
      <anchorfile>structsopt_1_1details_1_1HasValueType.html</anchorfile>
      <anchor>a9d6aa2dadaf943304802b05186923a57</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::details::HasValueType&lt; T, typename std::enable_if&lt; std::is_fundamental&lt; T &gt;::value &gt;::type &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1details_1_1HasValueType_3_01T_00_01typename_01std_1_1enable__if_3_01std_1_1is__fun157e8b90fda14b9c274aa8d70e4b6d2e.html</filename>
    <templarg></templarg>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::ImagingForwardBackward</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1ImagingForwardBackward.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::ImagingForwardBackward::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ImagingForwardBackward::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>typename FB::value_type</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a519b240eee940504861465aa37f43dc8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a060572e9f2986ad1990301335efe6ecb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>aee7462800f2cabbcd5dfc6dd12049332</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a720edc20fbae186fd3f6491ae6a3217f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a0f6582e53b23a6dec6cf8b5f00f55a48</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Proximal</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a362cb60f7d34ef7a5f207661b4a22d85</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Gradient</type>
      <name>t_Gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a03c5b50dd8cf296cb89e627e1e51aa60</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_IsConverged</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a969aca86a227e6cb6d392fada385491b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ImagingForwardBackward</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>aa65883194375705f1798cbd17f17b952</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ImagingForwardBackward</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>af2c1c67e818111aa1a3332d910a97ab4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a39b0d44f732ab968c8a28d00b9a0ba1e</anchor>
      <arglist>(l2_gradient, t_Gradient)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>af6dd645d05fc8beab591f5355f49305b</anchor>
      <arglist>(tight_frame, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>af6f8c78fdfb46c821071ebfb0c632f5b</anchor>
      <arglist>(residual_tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a8fadbacf37aa23754fc06a4528b4256d</anchor>
      <arglist>(relative_variation, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>add1de1aa9124c3dbd8099db6947ca793</anchor>
      <arglist>(residual_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>abff246387bb4383dbaaf29b69aea9841</anchor>
      <arglist>(objective_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>abb0bcd5bb1dc51bdaee93292ec5900b9</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>ada8a92000181951f6a0d788e8c5289f2</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a1a8ab5602979c481360edb61007888a1</anchor>
      <arglist>(beta, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a39ef5c4518a068c012cd0c0b91d6b0a3</anchor>
      <arglist>(sigma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>ab29954b1591cdc72830b641eb8143527</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>ad1e5e2b587a87f086b5a11031c1871d3</anchor>
      <arglist>(fista, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>aea0d826646132d8ea89dd23a503877ed</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a81b2cd01b9e9de940824fc835c636b72</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; GProximal&lt; SCALAR &gt; &gt;</type>
      <name>g_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a0173213ab9b73098f72e8df145c55ad5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>ImagingForwardBackward&lt; SCALAR &gt; &amp;</type>
      <name>g_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a1b5879322313df6b6d38be713226ed1e</anchor>
      <arglist>(std::shared_ptr&lt; GProximal&lt; SCALAR &gt;&gt; g_proximal)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>adc8eee4c8c0c0ad2b056a6a375c9b370</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>objmin</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a0214f60d792a6cbc4ad0a3a22ec19a49</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ImagingForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a5c3270a8456887434223f1c1b8ba2522</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a12325be5e433952ca7f46d7de165fec6</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>aea7c763090b3dd4f911a58a1b9ffdfff</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a75b473640e37aaa1ff28e4b8ff8420e0</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a8b26fe099ca3b34dc1179855f9948d31</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a5661d2363b17b34511db9bb864c061d4</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a74fae8a536fe10c3750e2f29632e2a42</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>af8cf6fa54dd1b2f467632abfcc687b0b</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>ImagingForwardBackward &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>aa068cb8568fc8f1dfa307b05bfbf89c5</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>t_Gradient &amp;</type>
      <name>l2_gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a9b16c4439aad39d80660476aa75e2512</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>ImagingForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>residual_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a9067eed6402bae92e4555d397c508f53</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>objective_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a9a42309ec02481a3a4beaecc6f19479c</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingForwardBackward.html</anchorfile>
      <anchor>a70d6aad850eaabad5242183c52f52851</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::ImagingPrimalDual</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1ImagingPrimalDual.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::ImagingPrimalDual::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ImagingPrimalDual::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>typename PD::value_type</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>aa47585b8224ae199363506c0f6ea71d2</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a34ac8a6c86f7ee68dc268b1345f3bad2</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a8e75bf491f6e1d49534170263eafd3b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a2c81ed11a3d97e4f8ea4e0abdb7251c3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a78a01a347892a7e40b9d07fb7dea56d3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(t_Vector &amp;, const T &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0ccd6061cf5b488893aa56903121b834</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_IsConverged</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>afff638fd31d09370f9d49552de84105b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Constraint</type>
      <name>t_Constraint</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a83fe7f0f57d06157903a3d0298be2321</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Random_Updater</type>
      <name>t_Random_Updater</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af73a8476cdd970c1f69af1ce1c6f56cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::value_type</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>aa47585b8224ae199363506c0f6ea71d2</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a34ac8a6c86f7ee68dc268b1345f3bad2</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a8e75bf491f6e1d49534170263eafd3b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a2c81ed11a3d97e4f8ea4e0abdb7251c3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a78a01a347892a7e40b9d07fb7dea56d3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(t_Vector &amp;, const T &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0ccd6061cf5b488893aa56903121b834</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_IsConverged</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>afff638fd31d09370f9d49552de84105b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Constraint</type>
      <name>t_Constraint</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a83fe7f0f57d06157903a3d0298be2321</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Random_Updater</type>
      <name>t_Random_Updater</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af73a8476cdd970c1f69af1ce1c6f56cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ImagingPrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac2878678c004392203d6441feedaef2b</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ImagingPrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a3c3df825f7a6ef2d0e2992d088e9a862</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual *</type>
      <name>g_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ae2abb4e5b8f1012a724e68c691b95681</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a12ba253e12643fe12c1ba544f256c4b8</anchor>
      <arglist>(l1_proximal, t_Proximal&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ab59131a837a406c455568460a093751f</anchor>
      <arglist>(l1_proximal_weighted, t_Proximal&lt; Vector&lt; Real &gt;&gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a5798abb03ad358525c39933f94d74419</anchor>
      <arglist>(l1_proximal_weights, Vector&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a3203b91c858e365d9ddc1630c3a3aec8</anchor>
      <arglist>(l2ball_proximal, proximal::WeightedL2Ball&lt; Scalar &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0e22a137f6b41de2c48844875a11fc80</anchor>
      <arglist>(residual_tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a7955208e788f8169d0fb13de21eadeb4</anchor>
      <arglist>(relative_variation, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a2a5393a6817b1218cc24acab93aa62ae</anchor>
      <arglist>(residual_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ad18738f3c0c7302727f5e5a737f2a912</anchor>
      <arglist>(objective_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a221a1e0f162a724d5fd5f445587b9f8f</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a1978addd19d0d783e8e88932ab44b4c4</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a56abf597fcb75c6ce455b9fa80c0671d</anchor>
      <arglist>(update_scale, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a956b101c5df328e99252f17d5a3e3b2f</anchor>
      <arglist>(positivity_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a1820a21b077904b5b9cbc46479018cd5</anchor>
      <arglist>(real_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a968a8e7fa461c345c6f727fa9c9e41cf</anchor>
      <arglist>(sigma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ad7c4ddd40d3841e5d79b29951c4f7f26</anchor>
      <arglist>(tau, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>acedc4899d9f5c3e7b27ae67d4a5622fd</anchor>
      <arglist>(xi, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a87cf7ff4b86ed7f87c5f3d2cd217967a</anchor>
      <arglist>(rho, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>aa18fff7542906be32f597d0646438d8a</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a9154f17456583b5f419bcc27aa61ab5a</anchor>
      <arglist>(precondition_stepsize, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>accf9a4d1839d44c8aff9010cd0af6e47</anchor>
      <arglist>(precondition_weights, t_Vector)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac2b1b229d63a30ee8bf9ccf0e30e0b98</anchor>
      <arglist>(precondition_iters, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>abc1eb617466597152d6da202e90a4a44</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a1ab39b382e269450a84e3dc88cb07bd9</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0af23b20a235659c3d6b80389ec435c7</anchor>
      <arglist>(Psi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a3dc166c1f9d6f02ea84ee3f6949c808f</anchor>
      <arglist>(random_measurement_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af86250c269e4328b60cc7442fc1a5249</anchor>
      <arglist>(random_wavelet_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a65261ec514e4fea8ebef80974ea33992</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>acb68f75e101bc48a7f94583c06f1f231</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>acc9f411a5a111491999787b8a4f05d1c</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a114036dd2c640b761349d90fbeb5a016</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a5b44ff37220f1bcfe093df856ba90419</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a4efb653dbdb3cdefcdd18e904f0a100c</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a11437055fe0b6f798858458dc42d9874</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a8759cc95811fae0ecb47511735b3dfbd</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af0ec33ec50dd6971de6984cc8f63eebf</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af070910d13eae3e2bb243ff77e42872d</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>proximal::WeightedL2Ball&lt; Scalar &gt; &amp;</type>
      <name>l2ball_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac54a3103f5c9badffa19baa702828fc1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0f112194d6712353767cb04ec7257fb9</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a4c760a9a961ea0779408dbc8ad081046</anchor>
      <arglist>(epsilon, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a5453d838791d46209a1f60403d642dad</anchor>
      <arglist>(weights, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>residual_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac50916dbeaaf6d1ce5ca2f38057a4856</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>objective_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a6895c34a3b28663ac62f5e2c23e0eb8e</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ab0ca2f78a78f768fa6495f037765b6dc</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ImagingPrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac2878678c004392203d6441feedaef2b</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ImagingPrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a3c3df825f7a6ef2d0e2992d088e9a862</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>abbf25eb2c88cdcb148f00b00f5b2011b</anchor>
      <arglist>(l2_proximal, t_Proximal&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a1d69f6baec615c21cebe96a3379e80ae</anchor>
      <arglist>(l2_proximal_weighted, t_Proximal&lt; Vector&lt; Real &gt;&gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a5750c86d2b956c3aea23a82659517772</anchor>
      <arglist>(l2_proximal_weights, Vector&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a3203b91c858e365d9ddc1630c3a3aec8</anchor>
      <arglist>(l2ball_proximal, proximal::WeightedL2Ball&lt; Scalar &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0e22a137f6b41de2c48844875a11fc80</anchor>
      <arglist>(residual_tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a7955208e788f8169d0fb13de21eadeb4</anchor>
      <arglist>(relative_variation, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a2a5393a6817b1218cc24acab93aa62ae</anchor>
      <arglist>(residual_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ad18738f3c0c7302727f5e5a737f2a912</anchor>
      <arglist>(objective_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a221a1e0f162a724d5fd5f445587b9f8f</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a1978addd19d0d783e8e88932ab44b4c4</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a56abf597fcb75c6ce455b9fa80c0671d</anchor>
      <arglist>(update_scale, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a956b101c5df328e99252f17d5a3e3b2f</anchor>
      <arglist>(positivity_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a1820a21b077904b5b9cbc46479018cd5</anchor>
      <arglist>(real_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a968a8e7fa461c345c6f727fa9c9e41cf</anchor>
      <arglist>(sigma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ad7c4ddd40d3841e5d79b29951c4f7f26</anchor>
      <arglist>(tau, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>acedc4899d9f5c3e7b27ae67d4a5622fd</anchor>
      <arglist>(xi, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a87cf7ff4b86ed7f87c5f3d2cd217967a</anchor>
      <arglist>(rho, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>aa18fff7542906be32f597d0646438d8a</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a9154f17456583b5f419bcc27aa61ab5a</anchor>
      <arglist>(precondition_stepsize, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>accf9a4d1839d44c8aff9010cd0af6e47</anchor>
      <arglist>(precondition_weights, t_Vector)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac2b1b229d63a30ee8bf9ccf0e30e0b98</anchor>
      <arglist>(precondition_iters, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>abc1eb617466597152d6da202e90a4a44</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a1ab39b382e269450a84e3dc88cb07bd9</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0af23b20a235659c3d6b80389ec435c7</anchor>
      <arglist>(Psi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a3dc166c1f9d6f02ea84ee3f6949c808f</anchor>
      <arglist>(random_measurement_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af86250c269e4328b60cc7442fc1a5249</anchor>
      <arglist>(random_wavelet_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a65261ec514e4fea8ebef80974ea33992</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>acb68f75e101bc48a7f94583c06f1f231</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>acc9f411a5a111491999787b8a4f05d1c</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a114036dd2c640b761349d90fbeb5a016</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a5b44ff37220f1bcfe093df856ba90419</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a4efb653dbdb3cdefcdd18e904f0a100c</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a11437055fe0b6f798858458dc42d9874</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a8759cc95811fae0ecb47511735b3dfbd</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af0ec33ec50dd6971de6984cc8f63eebf</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>af070910d13eae3e2bb243ff77e42872d</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>proximal::WeightedL2Ball&lt; Scalar &gt; &amp;</type>
      <name>l2ball_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac54a3103f5c9badffa19baa702828fc1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a0f112194d6712353767cb04ec7257fb9</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a4c760a9a961ea0779408dbc8ad081046</anchor>
      <arglist>(epsilon, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a5453d838791d46209a1f60403d642dad</anchor>
      <arglist>(weights, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>residual_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ac50916dbeaaf6d1ce5ca2f38057a4856</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>objective_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>a6895c34a3b28663ac62f5e2c23e0eb8e</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingPrimalDual.html</anchorfile>
      <anchor>ab0ca2f78a78f768fa6495f037765b6dc</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::ImagingProximalADMM</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1ImagingProximalADMM.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::ImagingProximalADMM::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ImagingProximalADMM::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>typename PADMM::value_type</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ab798c7ff74151af9af2175ce3de9107f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PADMM::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a26cde62588355a949c3f678943626149</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PADMM::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a5d171be24d068aaa1638b7180fc6bf06</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PADMM::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a65eb83693568a840443f7b1820509894</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PADMM::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a1522a6fa469f0c4e752be210c661e94e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PADMM::t_Proximal</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ae9157e1865fed8dea0b884faa18d554d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PADMM::t_IsConverged</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a7110840f605e18c6e550e0377adc72c3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ImagingProximalADMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a050021058a2b776429b956e7d7367a64</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ImagingProximalADMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a6a491f56cebaac4300a3a76827e07c33</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>proximal::L1&lt; Scalar &gt; *</type>
      <name>g_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a9606da211321ccb6dcf17544d3b3f933</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>aab71710c719541d4afe7ae09f8fb0d5b</anchor>
      <arglist>(l1_proximal, proximal::L1&lt; Scalar &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>afba411cc14efc2606929faef8aeda7a4</anchor>
      <arglist>(l2ball_proximal, proximal::WeightedL2Ball&lt; Scalar &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a88a7473ee81e4f493565d739f8e9da76</anchor>
      <arglist>(tight_frame, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a0f23ba5f168627ab41678003158ac2f5</anchor>
      <arglist>(residual_tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ac17fed0175283207b61bdd48c6b96a71</anchor>
      <arglist>(relative_variation, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ababfd9f0c3b9d6a4d59021881e5111c6</anchor>
      <arglist>(residual_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a4e957c3f4813b66aec0e5ccc524d3a62</anchor>
      <arglist>(objective_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ae06fe0c4bf1ec48e03e7492afcd5e2e2</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>af51db335d8e3a3b3326e7d48b965e1d5</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a16cd4ad3c1e15042287783e19a3b3f78</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>aa4fdb0c145663c6ce97b937086da2410</anchor>
      <arglist>(lagrange_update_scale, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a0b28b0fd63f61b97220591928894f510</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>aa0df4d876294b6c8efc24aaaaef2487e</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a00a7df2deff78ecacd63f05aeb1dacf3</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ImagingProximalADMM&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a9a092c4991fa77dd2d97c4df0cb0d665</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ad72dda9b8456c20274e35e3ca9e07df7</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a4acb2b98861f7d7d522a959b1540d605</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ab399d3bb55581f955ffbe8816bec940f</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a3eb6b367fbd252199d09cf7c13286de4</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a3fc75b235120754dc7fd05fd1fd75065</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a967db08896594222898fcdcfae29d6df</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a2e18fdcc18fc0f828f91d67682de200b</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>ImagingProximalADMM &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>adc689341fac9d4432c269bb9e0bd121a</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>proximal::L1&lt; Scalar &gt; &amp;</type>
      <name>l1_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a13f2b3576b20ad05c3540c3702813bec</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>proximal::WeightedL2Ball&lt; Scalar &gt; &amp;</type>
      <name>l2ball_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>af90cea9890b8380d68a775dd77d6147e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const t_LinearTransform &amp;</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a1906033fff423b2aee743a64ea01e9b8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ImagingProximalADMM&lt; Scalar &gt; &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a23f92d5e23770390af8acbd8f020be71</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a832f1d744f9e26935d70d939f10001eb</anchor>
      <arglist>(itermax, l1, L1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a13a4ffd81581b98ce8a074e40c1e5d8e</anchor>
      <arglist>(tolerance, l1, L1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ab20df9ad9ea7befae2e78a64edc34856</anchor>
      <arglist>(positivity_constraint, l1, L1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>ad88cbf172b4b5fc0ab3259ccb3e529af</anchor>
      <arglist>(real_constraint, l1, L1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a17c97a8dbb5cd20e7e1bf4b7477a5e8f</anchor>
      <arglist>(fista_mixing, l1, L1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a9f6090819eb59f2c30811d12a8856cbc</anchor>
      <arglist>(nu, l1, L1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a8b4c6aae2b88ac6be0e21a4edbdba432</anchor>
      <arglist>(weights, l1, L1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a0e742820f2ed8f5c30005747e954a691</anchor>
      <arglist>(epsilon, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a0e4d6cf41ac9aabb2b0c4789accc93ad</anchor>
      <arglist>(weights, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type>ImagingProximalADMM&lt; Scalar &gt; &amp;</type>
      <name>residual_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a99bfcc4355c8eae813fe6aeedd1c4850</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingProximalADMM&lt; Scalar &gt; &amp;</type>
      <name>objective_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a5aaf56d15c81470eede6c3189fbc77b3</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>ImagingProximalADMM&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ImagingProximalADMM.html</anchorfile>
      <anchor>a50b94664939eed1c0e77ab6aee545dc3</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>IntrospectSDMM</name>
    <filename>http://astro-informatics.github.io/sopt/classIntrospectSDMM.html</filename>
    <base>SDMM&lt; Scalar &gt;</base>
  </compound>
  <compound kind="struct">
    <name>sopt::is_complex</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1is__complex.html</filename>
    <templarg></templarg>
    <templarg></templarg>
  </compound>
  <compound kind="struct">
    <name>sopt::is_complex&lt; std::complex&lt; T &gt;, void &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1is__complex_3_01std_1_1complex_3_01T_01_4_00_01void_01_4.html</filename>
    <templarg></templarg>
  </compound>
  <compound kind="struct">
    <name>is_imaging_proximal_ref</name>
    <filename>http://astro-informatics.github.io/sopt/structis__imaging__proximal__ref.html</filename>
    <templarg></templarg>
  </compound>
  <compound kind="struct">
    <name>is_l1_g_proximal_ref</name>
    <filename>http://astro-informatics.github.io/sopt/structis__l1__g__proximal__ref.html</filename>
    <templarg></templarg>
  </compound>
  <compound kind="struct">
    <name>is_primal_dual_ref</name>
    <filename>http://astro-informatics.github.io/sopt/structis__primal__dual__ref.html</filename>
    <templarg></templarg>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::JointMAP</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1JointMAP.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::JointMAP::DiagnosticAndResultReg</class>
    <member kind="function">
      <type></type>
      <name>JointMAP</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>a2699db6c59532f6c4e592f7fdbab6250</anchor>
      <arglist>(const std::shared_ptr&lt; ALGORITHM &gt; &amp;algo_ptr, const t_Reg_Term &amp;reg_term, const t_uint number_of_wavelet_coeffs)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>adccd5bef1bc10c59063107e960406172</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>a7e642245497933017075699aa83fab7e</anchor>
      <arglist>(alpha, t_real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>a8872478d77bf96626a61ecec76814327</anchor>
      <arglist>(beta, t_real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>aefa316fe8be7f1cd51ebc02407179a15</anchor>
      <arglist>(k, t_real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>aec6389f8486c99cdc6483d7b3fc3e56d</anchor>
      <arglist>(number_of_wavelet_coeffs, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>acf82111a9700ac1af55e6101910e9378</anchor>
      <arglist>(algo_ptr, std::shared_ptr&lt; ALGORITHM &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>aac2c4566137b79fdb0e28e6367f25059</anchor>
      <arglist>(reg_term, t_Reg_Term)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>a94f7b62bd0096d1fb2332da023b7fb63</anchor>
      <arglist>(relative_variation, t_real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>a2cf2ee2fd990b161f5b2cf5bfff9a314</anchor>
      <arglist>(objective_variation, t_real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>ae2cf333179b59b41c05dda0340716446</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResultReg</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1JointMAP.html</anchorfile>
      <anchor>ad9861024dc6dc10c0e03292b374722d8</anchor>
      <arglist>(ARGS &amp;&amp;... args) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::L1</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L1.html</filename>
    <templarg></templarg>
    <base protection="private">sopt::proximal::L1TightFrame</base>
    <class kind="class">sopt::proximal::L1::Breaker</class>
    <class kind="struct">sopt::proximal::L1::Diagnostic</class>
    <class kind="struct">sopt::proximal::L1::DiagnosticAndResult</class>
    <class kind="class">sopt::proximal::L1::FistaMixing</class>
    <class kind="class">sopt::proximal::L1::NoMixing</class>
    <member kind="typedef">
      <type>typename L1TightFrame&lt; SCALAR &gt;::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>adaf15454c9337af69e5b04869c805587</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename L1TightFrame&lt; SCALAR &gt;::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>aa0849fe22174798f8bc05c68782b96f0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a7f8ef2119a88f504e5d563115dad987b</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; &amp;out, Real gamma, Vector&lt; Scalar &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a2fa15c7461cbad2b7814a098ab755291</anchor>
      <arglist>(Real const &amp;gamma, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L1</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>aa06fac802e8189e7b77956a163dae1b7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>ac32def157dfedc78b129d25f8bbbae04</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a381212523a8e8ca4abf2ef7eab09fb02</anchor>
      <arglist>(tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>acef4f016ba41bdc3a340a9d66f67016d</anchor>
      <arglist>(positivity_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a7e2f380dd56511e096a041d102d12a21</anchor>
      <arglist>(real_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a4abdd16c134bf05be401daf523f4f762</anchor>
      <arglist>(fista_mixing, bool)</arglist>
    </member>
    <member kind="function">
      <type>const Vector&lt; Real &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a979cc6954c5562e0e5a8ae361ccaff7d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a9e5d7a3e7cbaa3e6bd1a2bb41e4679ed</anchor>
      <arglist>(Eigen::MatrixBase&lt; T &gt; const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>af248d250705c4263670ecb63be43cdf6</anchor>
      <arglist>(Real const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>nu</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>ab4de2abbc22fc97ea149f155748aa53a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;</type>
      <name>nu</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a6a8fdd515ef5a6ec7d5816c9ad0c6e56</anchor>
      <arglist>(Real const &amp;nu)</arglist>
    </member>
    <member kind="function">
      <type>const LinearTransform&lt; Vector&lt; Scalar &gt; &gt; &amp;</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>ae9eaf2d264a7a1918bdf894123abbe73</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a7ee0a8c05b73d177e5733470bc71f577</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>tight_frame</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a218cc680ab3bf2324b95f176d8318313</anchor>
      <arglist>(T &amp;&amp;... args) const -&gt; decltype(this-&gt;L1TightFrame&lt; Scalar &gt;::operator()(std::forward&lt; T &gt;(args)...))</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>L1&lt; Scalar &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L1.html</filename>
    <base protection="private">L1TightFrame&lt; Scalar &gt;</base>
    <member kind="typedef">
      <type>typename L1TightFrame&lt; Scalar &gt;::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>adaf15454c9337af69e5b04869c805587</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename L1TightFrame&lt; Scalar &gt;::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>aa0849fe22174798f8bc05c68782b96f0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a7f8ef2119a88f504e5d563115dad987b</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; &amp;out, Real gamma, Vector&lt; Scalar &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a2fa15c7461cbad2b7814a098ab755291</anchor>
      <arglist>(Real const &amp;gamma, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L1</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>aa06fac802e8189e7b77956a163dae1b7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>ac32def157dfedc78b129d25f8bbbae04</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a381212523a8e8ca4abf2ef7eab09fb02</anchor>
      <arglist>(tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>acef4f016ba41bdc3a340a9d66f67016d</anchor>
      <arglist>(positivity_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a7e2f380dd56511e096a041d102d12a21</anchor>
      <arglist>(real_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a4abdd16c134bf05be401daf523f4f762</anchor>
      <arglist>(fista_mixing, bool)</arglist>
    </member>
    <member kind="function">
      <type>const Vector&lt; Real &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a979cc6954c5562e0e5a8ae361ccaff7d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a9e5d7a3e7cbaa3e6bd1a2bb41e4679ed</anchor>
      <arglist>(Eigen::MatrixBase&lt; T &gt; const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>af248d250705c4263670ecb63be43cdf6</anchor>
      <arglist>(Real const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>nu</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>ab4de2abbc22fc97ea149f155748aa53a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;</type>
      <name>nu</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a6a8fdd515ef5a6ec7d5816c9ad0c6e56</anchor>
      <arglist>(Real const &amp;nu)</arglist>
    </member>
    <member kind="function">
      <type>const LinearTransform&lt; Vector&lt; Scalar &gt; &gt; &amp;</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>ae9eaf2d264a7a1918bdf894123abbe73</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1&lt; Scalar &gt; &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a7ee0a8c05b73d177e5733470bc71f577</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>tight_frame</name>
      <anchorfile>classsopt_1_1proximal_1_1L1.html</anchorfile>
      <anchor>a218cc680ab3bf2324b95f176d8318313</anchor>
      <arglist>(T &amp;&amp;... args) const -&gt; decltype(this-&gt;L1TightFrame&lt; Scalar &gt;::operator()(std::forward&lt; T &gt;(args)...))</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::L1GProximal</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1L1GProximal.html</filename>
    <templarg></templarg>
    <base>GProximal</base>
    <member kind="typedef">
      <type>ForwardBackward&lt; SCALAR &gt;</type>
      <name>FB</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>ab2ec0dac927c3001dd0b2e339a28d2c3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a37271ee5199c9c09c4cd2e96142f4d7a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a0c9546defe4c97919188d856501b9ac5</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a71ca8a4c435710ec37a928d0f69bed00</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Proximal</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a2d2dea58efebddc37a16f3d12339271a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a57fe7a5f6e4b80cc8e0705336486597c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L1GProximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a2528793354ae8a8b8515b78eca39988c</anchor>
      <arglist>(bool tight_frame=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~L1GProximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a2a593112a39f2837a4e4d10fce471ac6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>log_message</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a6a076a76a24b0b4fe63bfe9ae81a0676</anchor>
      <arglist>() const override</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>proximal_norm</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>aa042855284f50c371eed859e0acab2d1</anchor>
      <arglist>(t_Vector const &amp;x) const override</arglist>
    </member>
    <member kind="function">
      <type>t_Proximal</type>
      <name>proximal_function</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>aef10e4b2cd001b5cbe6ad381a5914e30</anchor>
      <arglist>() const override</arglist>
    </member>
    <member kind="function">
      <type>const t_LinearTransform &amp;</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a69b81084e8f9356cec11cdf735ec5fe1</anchor>
      <arglist>() const override</arglist>
    </member>
    <member kind="function">
      <type>proximal::L1&lt; Scalar &gt; &amp;</type>
      <name>l1_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a88f08d0c95712bb0b1930e0069aeae61</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const proximal::L1&lt; Scalar &gt; &amp;</type>
      <name>l1_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>aae71f4b9d78dd4fed67d985f6fe7516b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1GProximal&lt; SCALAR &gt; &amp;</type>
      <name>l1_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a390b32e4a898800668a4875cd416bb27</anchor>
      <arglist>(proximal::L1&lt; Scalar &gt; const &amp;arg)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>ae4d9a5ee122dfffcb04df3ca7eeb839e</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>aa0f89db1f5a26c658dcb01e37bf155f6</anchor>
      <arglist>(tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a48acf23f3429ff31386dfd03801687b7</anchor>
      <arglist>(positivity_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>acfcb3995ee6874fdc800240db5fe119b</anchor>
      <arglist>(real_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a0a7d0173c8cc74a7d72ad263c6caff82</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>ac978568a561ad49d3586b667adb4c630</anchor>
      <arglist>(weights, Vector&lt; t_real &gt;)</arglist>
    </member>
    <member kind="function">
      <type>L1GProximal&lt; SCALAR &gt; &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1L1GProximal.html</anchorfile>
      <anchor>a137ef79f297f45222e00a3ade62caa84</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::L1TightFrame</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L1TightFrame.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>SCALAR</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>aea4afdb1952684df513c585a5e562a9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a86ac1a28fb7511827cde7f7e9bde0617</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L1TightFrame</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a519d513a222fe68ee07c0f87cdaf35f9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>ab5a48f0beeddb046251a03c97a096630</anchor>
      <arglist>(Psi, LinearTransform&lt; Vector&lt; Scalar &gt;&gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a3a2d8f5859f8dfec122c5ddd5b0838cc</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type>const Vector&lt; Real &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>af8155eceda785635bbfdc7c92e74ba58</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1TightFrame&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a138521eba36dbd213be33bf9d3d5da8f</anchor>
      <arglist>(Eigen::MatrixBase&lt; T &gt; const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>L1TightFrame&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a963b40466cde22565b00129bcbae9bc1</anchor>
      <arglist>(Real const &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>L1TightFrame &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>abd0a06bf9e722cde809e28c1da99f4d4</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T0::Scalar &gt;::value and is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T1::Scalar &gt;::value &gt;::type</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a545de2732e3949dca5d945f919ea28bb</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; &amp;out, Real gamma, Eigen::MatrixBase&lt; T1 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>ProximalExpression&lt; L1TightFrame&lt; Scalar &gt; const &amp;, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a92637990ae1686d0be717b3a999bf9f1</anchor>
      <arglist>(Real const &amp;gamma, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T0::Scalar &gt;::value and is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T1::Scalar &gt;::value, Real &gt;::type</type>
      <name>objective</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>aaba4ab747fed7c9c16de6858e97d13d2</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x, Eigen::MatrixBase&lt; T1 &gt; const &amp;z, Real const &amp;gamma) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>L1TightFrame&lt; Scalar &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L1TightFrame.html</filename>
    <member kind="typedef">
      <type>Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>aea4afdb1952684df513c585a5e562a9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a86ac1a28fb7511827cde7f7e9bde0617</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L1TightFrame</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a519d513a222fe68ee07c0f87cdaf35f9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>ab5a48f0beeddb046251a03c97a096630</anchor>
      <arglist>(Psi, LinearTransform&lt; Vector&lt; Scalar &gt;&gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a3a2d8f5859f8dfec122c5ddd5b0838cc</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type>const Vector&lt; Real &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>af8155eceda785635bbfdc7c92e74ba58</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L1TightFrame&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a138521eba36dbd213be33bf9d3d5da8f</anchor>
      <arglist>(Eigen::MatrixBase&lt; T &gt; const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>L1TightFrame&lt; Scalar &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a963b40466cde22565b00129bcbae9bc1</anchor>
      <arglist>(Real const &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>L1TightFrame &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>abd0a06bf9e722cde809e28c1da99f4d4</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T0::Scalar &gt;::value and is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T1::Scalar &gt;::value &gt;::type</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a545de2732e3949dca5d945f919ea28bb</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; &amp;out, Real gamma, Eigen::MatrixBase&lt; T1 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>ProximalExpression&lt; L1TightFrame&lt; Scalar &gt; const &amp;, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>a92637990ae1686d0be717b3a999bf9f1</anchor>
      <arglist>(Real const &amp;gamma, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T0::Scalar &gt;::value and is_complex&lt; Scalar &gt;::value==is_complex&lt; typename T1::Scalar &gt;::value, Real &gt;::type</type>
      <name>objective</name>
      <anchorfile>classsopt_1_1proximal_1_1L1TightFrame.html</anchorfile>
      <anchor>aaba4ab747fed7c9c16de6858e97d13d2</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x, Eigen::MatrixBase&lt; T1 &gt; const &amp;z, Real const &amp;gamma) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::L2Ball</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L2Ball.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename real_type&lt; T &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>acdd61917fc738477b5cac14b66c7537c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L2Ball</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>a64f316c375a0f130b1d4a2e5f2c9199d</anchor>
      <arglist>(Real epsilon)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>a1e860d136f69f4e037d8d4d4784e6b73</anchor>
      <arglist>(Vector&lt; T &gt; &amp;out, typename real_type&lt; T &gt;::type, Vector&lt; T &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>aef473caf2faffe3eb58e5b6beceece48</anchor>
      <arglist>(Vector&lt; T &gt; &amp;out, Vector&lt; T &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>EnveloppeExpression&lt; L2Ball, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>a7138ae67d0e0c0f6fb6e24e75ca15f74</anchor>
      <arglist>(Real const &amp;, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>EnveloppeExpression&lt; L2Ball, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>adfe0bcd88a9d09f09bd3a1b19549a81a</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>epsilon</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>a08b97dbbd9e32739f541f88360ccfecf</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L2Ball&lt; T &gt; &amp;</type>
      <name>epsilon</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Ball.html</anchorfile>
      <anchor>aadf6fb56a7f93619182f2806c0c3e299</anchor>
      <arglist>(Real eps)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::L2ForwardBackward</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1L2ForwardBackward.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::L2ForwardBackward::Diagnostic</class>
    <class kind="struct">sopt::algorithm::L2ForwardBackward::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>typename FB::value_type</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>ac6538e42f6ae967990cbf3f3f2d624e3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a4581b824cbd0a2216aa61242f5153ca1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>aec275ec6cca281cd0d597c16c5b9252a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a628fbda762ed482f1d5c5d82fc80d1c8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a53d8d258741f7f048ff21a1451be7c2b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(t_Vector &amp;, const T &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a61ed97679fcfe0b1053829d4b00b28d0</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Gradient</type>
      <name>t_Gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a56e9332c70f1a8f9e9e65c0ce389356c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_IsConverged</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>ae7792e7ee5c0bb9a0680957eb2567474</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L2ForwardBackward</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a25ea1d752f8c88c178c30ee4e5776e70</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~L2ForwardBackward</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>afb8a75c01f304ce9515a6e38948be6db</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a973dd8aeb160d2ffa8e63e8579a53ede</anchor>
      <arglist>(l2_proximal, t_Proximal&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>ab7e2b3784b4d2ef2e84e2758f305c063</anchor>
      <arglist>(l2_proximal_weighted, t_Proximal&lt; Vector&lt; Real &gt;&gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>af10b4eb44906724b875ca8ada1895986</anchor>
      <arglist>(l2_proximal_weights, Vector&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a9c58abdaf75a78f2ee9508722c54d18c</anchor>
      <arglist>(l2_gradient, t_Gradient)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a524a872e1e1a3c96e0487eb2d688c111</anchor>
      <arglist>(tight_frame, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a027d7fe6cecf7292fff8b40bca98d6fc</anchor>
      <arglist>(residual_tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>acb05fc82bfdd1ed987cd0010cd014243</anchor>
      <arglist>(relative_variation, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>aa17a3205813506b99796f5f22ed944d4</anchor>
      <arglist>(residual_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a93bd9d28568f83e0d3f04be2ac63671d</anchor>
      <arglist>(objective_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a775c25b062c030aa5d0aa254914940d0</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>addd2a4f447cb5109dd46a6c7de0f0a45</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>ac60c1cee4206a45318bd8340e4b2f53c</anchor>
      <arglist>(beta, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a0c562b29ca544570630c0179a3630395</anchor>
      <arglist>(sigma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a49fa1254a1257acba327b8d2c28eee6f</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a1572343283cb56cfb33d317fa3baa997</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a081f745fad492619c557342dc87c045c</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a5df857c5b668ba9fc364d23cae56ef30</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>objmin</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a39d5d06c1d735f57333688235462c9c3</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>L2ForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a7b14be5e929084f0e72e76d979946c89</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>abfecf153ecc221f4cccf7726991703ca</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a493de764954d44277d02e3b0018fbcfd</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a8cd251aea7c9cb42bb6ccecbb05098d6</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a4e50aef8a4507ceeaf458d6523d8423e</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a1234a337da937ee7710ee827f21ba181</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a652bae231e1e7b89489b28e5f3e70afa</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a61571585a04b950595b55c1302e03e2f</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>L2ForwardBackward &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a6b426207a67a3e09d6c59e0960077efc</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>t_Proximal&lt; Real &gt; &amp;</type>
      <name>l2_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a260f8207ad5bd1e92018895465afe309</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>t_Proximal&lt; Vector&lt; Real &gt; &gt; &amp;</type>
      <name>l2_proximal_weighted</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>ad6b4fd105f11b5270e315b1eae869983</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>t_Gradient &amp;</type>
      <name>l2_gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a293f28b86cc017ab2c2a878bf19e9514</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>L2ForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>residual_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>ab5a965495e9f1e949402af11f6ac0bc7</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>L2ForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>objective_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a55204bd625db2542eae23fee65438ab5</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>L2ForwardBackward&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1L2ForwardBackward.html</anchorfile>
      <anchor>a95a537c1eee727ccb334b7d4db5d4580</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::L2Norm</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L2Norm.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename real_type&lt; T &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Norm.html</anchorfile>
      <anchor>a8f5d0016f758d2286d23f4544415b8a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>L2Norm</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Norm.html</anchorfile>
      <anchor>ad40bec56fd94db8fbedcf9165a661270</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Norm.html</anchorfile>
      <anchor>a5fd6ac4291060ca743140f6a6fe73ffa</anchor>
      <arglist>(Vector&lt; T &gt; &amp;out, const Real gamma, Vector&lt; T &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>EnveloppeExpression&lt; L2Norm, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Norm.html</anchorfile>
      <anchor>a0b08bc0d467feed77214f8344b3aaa5b</anchor>
      <arglist>(Real const &amp;, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>EnveloppeExpression&lt; L2Norm, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L2Norm.html</anchorfile>
      <anchor>a9070d33eef20001b4a6ff900f8be4a39</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::LinearTransform</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1LinearTransform.html</filename>
    <templarg></templarg>
    <base>sopt::details::WrapFunction</base>
    <member kind="typedef">
      <type>OperatorFunction&lt; VECTOR &gt;</type>
      <name>t_Function</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a4f14b87d902be4bf46e2ea5ad1801ef5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a653b6af71c698632c208639c19870439</anchor>
      <arglist>(t_Function const &amp;direct, t_Function const &amp;indirect, std::array&lt; t_int, 3 &gt; sizes={{1, 1, 0}})</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a43e425e3a0b156cb450f52afb7aec423</anchor>
      <arglist>(t_Function const &amp;direct, std::array&lt; t_int, 3 &gt; dsizes, t_Function const &amp;indirect, std::array&lt; t_int, 3 &gt; isizes)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>af0c0e0bafc42293597ae1f7cff97a933</anchor>
      <arglist>(details::WrapFunction&lt; VECTOR &gt; const &amp;direct, details::WrapFunction&lt; VECTOR &gt; const &amp;indirect)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>ae592ce3008d60a06a49f33510e3a3dd7</anchor>
      <arglist>(LinearTransform const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a40180064a59e1e0f2f648cae491b3744</anchor>
      <arglist>(LinearTransform &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a23718b8c618a79715b457745dd2cbadf</anchor>
      <arglist>(LinearTransform const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>aa5f1572d1aef887a4009c09aeec2556d</anchor>
      <arglist>(LinearTransform &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt;</type>
      <name>adjoint</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>af9fe77b8afc0761cf9d07f432df85a0d</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>LinearTransform&lt; t_Vector &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1LinearTransform.html</filename>
    <base>WrapFunction&lt; t_Vector &gt;</base>
    <member kind="typedef">
      <type>OperatorFunction&lt; t_Vector &gt;</type>
      <name>t_Function</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a4f14b87d902be4bf46e2ea5ad1801ef5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a653b6af71c698632c208639c19870439</anchor>
      <arglist>(t_Function const &amp;direct, t_Function const &amp;indirect, std::array&lt; t_int, 3 &gt; sizes={{1, 1, 0}})</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a43e425e3a0b156cb450f52afb7aec423</anchor>
      <arglist>(t_Function const &amp;direct, std::array&lt; t_int, 3 &gt; dsizes, t_Function const &amp;indirect, std::array&lt; t_int, 3 &gt; isizes)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>af0c0e0bafc42293597ae1f7cff97a933</anchor>
      <arglist>(details::WrapFunction&lt; t_Vector &gt; const &amp;direct, details::WrapFunction&lt; t_Vector &gt; const &amp;indirect)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>ae592ce3008d60a06a49f33510e3a3dd7</anchor>
      <arglist>(LinearTransform const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>LinearTransform</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a40180064a59e1e0f2f648cae491b3744</anchor>
      <arglist>(LinearTransform &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>a23718b8c618a79715b457745dd2cbadf</anchor>
      <arglist>(LinearTransform const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>aa5f1572d1aef887a4009c09aeec2556d</anchor>
      <arglist>(LinearTransform &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; t_Vector &gt;</type>
      <name>adjoint</name>
      <anchorfile>classsopt_1_1LinearTransform.html</anchorfile>
      <anchor>af9fe77b8afc0761cf9d07f432df85a0d</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::MatrixAdjointToLinearTransform</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1MatrixAdjointToLinearTransform.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename MatrixToLinearTransform&lt; EIGEN &gt;::PlainObject</type>
      <name>PlainObject</name>
      <anchorfile>classsopt_1_1details_1_1MatrixAdjointToLinearTransform.html</anchorfile>
      <anchor>accb3b6fbefd511ff5db53afac630bb4b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MatrixAdjointToLinearTransform</name>
      <anchorfile>classsopt_1_1details_1_1MatrixAdjointToLinearTransform.html</anchorfile>
      <anchor>a7ce2f541316f9364bca8a2a82fbac9c4</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;A)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MatrixAdjointToLinearTransform</name>
      <anchorfile>classsopt_1_1details_1_1MatrixAdjointToLinearTransform.html</anchorfile>
      <anchor>a3f7a142fe5bd28d56a77cf336133f98f</anchor>
      <arglist>(std::shared_ptr&lt; EIGEN &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1MatrixAdjointToLinearTransform.html</anchorfile>
      <anchor>ad05e03adfdba131e244d1fbf340bd11c</anchor>
      <arglist>(PlainObject &amp;out, PlainObject const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>MatrixToLinearTransform&lt; EIGEN &gt;</type>
      <name>adjoint</name>
      <anchorfile>classsopt_1_1details_1_1MatrixAdjointToLinearTransform.html</anchorfile>
      <anchor>a73cb5028c94682bc8cc8f6b18ecf556d</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::MatrixToLinearTransform</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1MatrixToLinearTransform.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename std::conditional&lt; std::is_base_of&lt; Eigen::MatrixBase&lt; PlainMatrix &gt;, PlainMatrix &gt;::value, Vector&lt; typename PlainMatrix::Scalar &gt;, Array&lt; typename PlainMatrix::Scalar &gt; &gt;::type</type>
      <name>PlainObject</name>
      <anchorfile>classsopt_1_1details_1_1MatrixToLinearTransform.html</anchorfile>
      <anchor>afdd83f9048e9530ab421b0aae719cb70</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MatrixToLinearTransform</name>
      <anchorfile>classsopt_1_1details_1_1MatrixToLinearTransform.html</anchorfile>
      <anchor>ad965988ccd40489168a0bd9c3c9d0834</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;A)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MatrixToLinearTransform</name>
      <anchorfile>classsopt_1_1details_1_1MatrixToLinearTransform.html</anchorfile>
      <anchor>a4100c5c6fc4ee7602a2ae2e3845738db</anchor>
      <arglist>(std::shared_ptr&lt; EIGEN &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1MatrixToLinearTransform.html</anchorfile>
      <anchor>a9e9234d60ffc70517dbd9c239e548567</anchor>
      <arglist>(PlainObject &amp;out, PlainObject const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>MatrixAdjointToLinearTransform&lt; EIGEN &gt;</type>
      <name>adjoint</name>
      <anchorfile>classsopt_1_1details_1_1MatrixToLinearTransform.html</anchorfile>
      <anchor>a82a0cca5b726d48b913f2bc4e69d594d</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::L1::NoMixing</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1L1_1_1NoMixing.html</filename>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1L1_1_1NoMixing.html</anchorfile>
      <anchor>a00a31cf9de7790aea3e76ccb602452cc</anchor>
      <arglist>(Vector&lt; SCALAR &gt; &amp;previous, Eigen::MatrixBase&lt; T1 &gt; const &amp;unmixed, t_uint)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::PositiveQuadrant</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1PositiveQuadrant.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>ALGORITHM</type>
      <name>Algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a43f66b6b8e9d25eea2397aeda41c1850</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename Algorithm::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a0170e51d0c3d57e12cc1dbf9dd0b067f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename Algorithm::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a9dc2fa3de9cf464e2650a59c6c896c1d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename Algorithm::t_IsConverged</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>aeb7e169b274efdd8b504791905ae47f4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename ALGORITHM::Diagnostic</type>
      <name>Diagnostic</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a77875d316a901a3a9eb0d59c8f45c8ff</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename ALGORITHM::DiagnosticAndResult</type>
      <name>DiagnosticAndResult</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>ad68ef5762a4e3788a2815981261a4f37</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PositiveQuadrant</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a1cf64ec00fee16ad593d67fb50e5fa2e</anchor>
      <arglist>(Algorithm const &amp;algo)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PositiveQuadrant</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>aa022a53771bd9bdc0d416be99b41edd4</anchor>
      <arglist>(Algorithm &amp;&amp;algo)</arglist>
    </member>
    <member kind="function">
      <type>Algorithm &amp;</type>
      <name>algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a5843eae241da42caaf7d046e08b0a13e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Algorithm &amp;</type>
      <name>algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a66bc08b32d58288a1586f5d7823d3f1e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a4a25ebbe303333c0b9221ed7cecd62e3</anchor>
      <arglist>(t_Vector &amp;out, T const &amp;... args) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PositiveQuadrant.html</anchorfile>
      <anchor>a6828171bc114b98091f32698b83d589c</anchor>
      <arglist>(T const &amp;... args) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::PowerMethod</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1PowerMethod.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::PowerMethod::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>SCALAR</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>aa673e6b1811cf721a090332308e1d545</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>value_type</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a2bfaa89a1522b9630a8636f235eb21fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a1aca95e32e368d0c15a930e23d8eace7</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>ad4d0aed19499ff3f3578541a5a5aa41b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>LinearTransform&lt; t_Vector &gt;</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a9619d9eec1c83ae919b932ee1b74e2ca</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PowerMethod</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a338a9790d71ac28dd2377ce72d0f11bd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~PowerMethod</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a527c99f4991f119ec96003d356b9eac5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>AtA</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a515352fb01287645d32e748f821a136a</anchor>
      <arglist>(t_LinearTransform const &amp;A, t_Vector const &amp;input) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a804b372799d2970ccb307dccc0e05678</anchor>
      <arglist>(Eigen::DenseBase&lt; DERIVED &gt; const &amp;A, t_Vector const &amp;input) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PowerMethod.html</anchorfile>
      <anchor>a42c9b9061c5a50eab9874802373e9ea5</anchor>
      <arglist>(OperatorFunction&lt; t_Vector &gt; const &amp;op, t_Vector const &amp;input) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::PrimalDual</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1PrimalDual.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::PrimalDual::Diagnostic</class>
    <class kind="struct">sopt::algorithm::PrimalDual::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>SCALAR</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a11ae92bd3d052e6ec91c338286e868a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>value_type</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a78acc5d464746851a2b84f43ec0edf58</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aedc9c9a8e07ddba1c3c133deaae603b3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a45b60197f33e97195be934b70d975375</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>LinearTransform&lt; t_Vector &gt;</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a5c25983367c62fb5093979c15919c18d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; bool(const t_Vector &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a9b6d3c0265db819115024f368f86f527</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(t_Vector &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_Constraint</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a8845568abf535f9eed8db01829d78b3b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; bool()&gt;</type>
      <name>t_Random_Updater</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a42e08c0a14495e244cc03bd45b30e38c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ProximalFunction&lt; Scalar &gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a03ae6fd37b1978d33d4cc47921975781</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ab62e2b3245b7be909624b8076b412e04</anchor>
      <arglist>(t_Proximal const &amp;f_proximal, t_Proximal const &amp;g_proximal, Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~PrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a0843de67676f855c792b906936512499</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ac2a74575cb12345fb744341ad99a1097</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aff18cf637f0c4ab9ccbe14c308cb1065</anchor>
      <arglist>(update_scale, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aa1b6b8b193c60aa3e5004b7165acc011</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>af632cbf54789f78e60329c062c621d5a</anchor>
      <arglist>(sigma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a54316a191b2058d34e8ebd945e018b4b</anchor>
      <arglist>(xi, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a7e9163cdcd4ffd2d250f5d05ff237171</anchor>
      <arglist>(rho, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aa6dede0dc35a453659b06606f9f914af</anchor>
      <arglist>(tau, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a9c8e9a8721f2903dd7cf62f654f7f099</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a6f804bfd6a04525eb2bab2f529b8b2e4</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a8ed50ad6ef62aa1d44d18e6f0fd2671f</anchor>
      <arglist>(constraint, t_Constraint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a6e11ebe461a99d21b7aca34c973a191c</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ab7fd1d8ee0dfbb8ac69bd7d4dd5544c0</anchor>
      <arglist>(Psi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a37077b108426cf26380896f51d2923a2</anchor>
      <arglist>(f_proximal, t_Proximal)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aa046a47a5c66efb222a9cbaeb31acd6d</anchor>
      <arglist>(g_proximal, t_Proximal)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ac344a77876268295c0cd91dd9b148029</anchor>
      <arglist>(random_measurement_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a417b91d5e24362b858211a25df1b37e2</anchor>
      <arglist>(random_wavelet_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>f_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aa68279f9bc2127ea66e52012022d86d9</anchor>
      <arglist>(t_Vector &amp;out, Real gamma, t_Vector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>g_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ac422e051ec531e547a854cbab7cb004a</anchor>
      <arglist>(t_Vector &amp;out, Real gamma, t_Vector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>PrimalDual&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ab0030a6f46b8d9225e77a616051449ce</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a8ce1840fa471bd61cf684ecc28f35359</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>PrimalDual&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a0dcd471d25a8aedf80ddfb91929e46f8</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a54969111d9f5fd24577e2d1b71459b49</anchor>
      <arglist>(t_Vector const &amp;x, t_Vector const &amp;residual) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a477bfdc22317b657a8895d0b6dc1ac3e</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a337594e84e7fa39fd95eb69bf2fd5428</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a49a6ec4970c4370c7db0b5ca66fc65a8</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ad1e41ca50be73682a811e0c833619a85</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>ab4e6f025928ee8addc37f43be589dc1a</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a3ad0a358ab0424067dc7b92d4b86d8c9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aec7b3c972b37281b42f6feed57b84c21</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>PrimalDual &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a91d151813a8eee0469332889088acf17</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>PrimalDual &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a695638e6c1597112f1594bed46e9d1ae</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_Vector, t_Vector &gt;</type>
      <name>initial_guess</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>aea449fd612f6063653b3bf224a3c16a7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::tuple&lt; t_Vector, t_Vector &gt;</type>
      <name>initial_guess</name>
      <anchorfile>classsopt_1_1algorithm_1_1PrimalDual.html</anchorfile>
      <anchor>a0039c6b90f2c469f38fed3a90b62f7a0</anchor>
      <arglist>(t_Vector const &amp;target, t_LinearTransform const &amp;phi, Real nu)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::ProjectPositiveQuadrant</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1ProjectPositiveQuadrant.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>SCALAR</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1ProjectPositiveQuadrant.html</anchorfile>
      <anchor>a983af15bac34978f8ebcd947384f01e7</anchor>
      <arglist>(const SCALAR &amp;value) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::ProjectPositiveQuadrant&lt; std::complex&lt; SCALAR &gt; &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1ProjectPositiveQuadrant_3_01std_1_1complex_3_01SCALAR_01_4_01_4.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>SCALAR</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1ProjectPositiveQuadrant_3_01std_1_1complex_3_01SCALAR_01_4_01_4.html</anchorfile>
      <anchor>a770c8f2e5455d205339658ed912c03ed</anchor>
      <arglist>(SCALAR const &amp;value) const</arglist>
    </member>
    <member kind="function">
      <type>std::complex&lt; SCALAR &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1ProjectPositiveQuadrant_3_01std_1_1complex_3_01SCALAR_01_4_01_4.html</anchorfile>
      <anchor>a69c7c781ecfb1866a2de1b14552f2af1</anchor>
      <arglist>(std::complex&lt; SCALAR &gt; const &amp;value) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::ProximalADMM</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1ProximalADMM.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::ProximalADMM::Diagnostic</class>
    <class kind="struct">sopt::algorithm::ProximalADMM::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>SCALAR</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a218a9c4a840086f3d434f69339f2871c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>value_type</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a664a7aca60af0c2c2484e0946686809c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>ae475041c6e6ade17751f236f31fc4844</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a54fd131397766313d73e9693f0699e9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>LinearTransform&lt; t_Vector &gt;</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a5448e30adfb236dbcd628b335bbe7bf9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; bool(const t_Vector &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>ac4633437b78e15536df6a56a5175954d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ProximalFunction&lt; Scalar &gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a7ee844f51ffef27475c6709580ed6e07</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ProximalADMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a094ba9f88986dae7c90bdee9736ff474</anchor>
      <arglist>(t_Proximal const &amp;f_proximal, t_Proximal const &amp;g_proximal, Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ProximalADMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>aef4675fd7a38457ff606c9f51cc98a96</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a1eaf409c346c19b8692edabf3d35ff91</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a944a098c36473b56e6b108ff75599d78</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a0ef4ddd2dbf0aa34460fdf6540d7972e</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a8bc624626b2c3d3419850c91b7dc0d72</anchor>
      <arglist>(lagrange_update_scale, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a8129e8500e95c8d2dae14d15b877d6da</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>ad398346eba474cd47112f8a77d980ccc</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>aa0bbc0e896867b23624a08c0743873c7</anchor>
      <arglist>(f_proximal, t_Proximal)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a89a3c2f85a2e97d9b0f59f66194303a7</anchor>
      <arglist>(g_proximal, t_Proximal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>f_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a96a4fb1c1b4e9aaf8c716d2c3d416538</anchor>
      <arglist>(t_Vector &amp;out, Real gamma, t_Vector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>g_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a463d5fe15218df71370f16b70e22472a</anchor>
      <arglist>(t_Vector &amp;out, Real gamma, t_Vector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>ProximalADMM&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a37ba0ed391b2a76b28eb35602a027a07</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a96e02c2fc2e6651fb0228e55368d7022</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ProximalADMM&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a5d61301013e1b6ca548cb060c1ed0793</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>aa54c533074a487fae956f85ce2e6cd8a</anchor>
      <arglist>(t_Vector const &amp;x, t_Vector const &amp;residual) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a58271e222e251090523acbde8c311c86</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>af7642eafc5306f846a3985980874d25a</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a2d180485ee53358a44ad7778b9843a00</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>aa276737b4a91c636a33830fe5fc28da3</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>ac4485b6ce932b4066ea64f073ce1498d</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>ae513ed38c4ae241b9cbd07639eafc23c</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a9fb3bbc98c30c95e8351482ae6d060e2</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>ProximalADMM &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a9362a4dc424daf8e707372f79c5648b2</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_Vector, t_Vector &gt;</type>
      <name>initial_guess</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a911c5b24a23a173b503583ad0c2a5891</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::tuple&lt; t_Vector, t_Vector &gt;</type>
      <name>initial_guess</name>
      <anchorfile>classsopt_1_1algorithm_1_1ProximalADMM.html</anchorfile>
      <anchor>a9fc25eba4170d117543e09e87805c8de</anchor>
      <arglist>(t_Vector const &amp;target, t_LinearTransform const &amp;phi, Real nu)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::RelativeVariation</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1RelativeVariation.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>TYPE</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a07968ec5945360b6e0cc01d74f3048cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a24a70997c6474537b0ffe5ea15bf4aca</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RelativeVariation</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>ade83b7926b758ad37c4efedd488f5096</anchor>
      <arglist>(Real tolerance=1e-12, std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RelativeVariation</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a0117fc0f5b4fa1ac3810775d507d8c02</anchor>
      <arglist>(RelativeVariation const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a0f88625ca8d5b786eb6126cf4673119e</anchor>
      <arglist>(Eigen::MatrixBase&lt; T &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a241da36defcd8b6702e844cc608fc838</anchor>
      <arglist>(Eigen::ArrayBase&lt; T &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>tolerance</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a5c5bdca0a8d043e3c6531102ce43c226</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RelativeVariation &amp;</type>
      <name>tolerance</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a15640cbbcd740a3375c3186c0173ca97</anchor>
      <arglist>(Real &amp;e) const</arglist>
    </member>
    <member kind="function">
      <type>const std::string &amp;</type>
      <name>name</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a00e98b3e60c2898932b95f07bbde8da4</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const RelativeVariation &amp;</type>
      <name>name</name>
      <anchorfile>classsopt_1_1RelativeVariation.html</anchorfile>
      <anchor>a96134bf1fb6c589c4aad393d9bcde7ef</anchor>
      <arglist>(std::string const &amp;name) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::Reweighted</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1Reweighted.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::Reweighted::ReweightedResult</class>
    <member kind="typedef">
      <type>ALGORITHM</type>
      <name>Algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a10e9eb54d07d3441cf19ad2e02e93c9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename Algorithm::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>af9b31075e440420edc317eb80d248e41</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>ac094e45489e7dcc435abb4d2dda3202d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Real &gt;</type>
      <name>WeightVector</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a85ee526be62b83b372ba4f28298520f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename Algorithm::t_Vector</type>
      <name>XVector</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>af084f978bfeaa198aeabce8a75f53017</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ConvergenceFunction&lt; Scalar &gt;</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>afd1a2374c45b50a296015432c9f17464</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; XVector(const Algorithm &amp;, const XVector &amp;)&gt;</type>
      <name>t_Reweightee</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a898dc9d0702e42e3eabf4b18bb5c669e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(Algorithm &amp;, const WeightVector &amp;)&gt;</type>
      <name>t_SetWeights</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a502a97b554cea1f2a27005eaf07cc47b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; Real(Real)&gt;</type>
      <name>t_DeltaUpdate</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a46c01d2dac3d126ec8321e3f1d6fb510</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Reweighted</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a4c537377a0bdeb26b29d18f580b3224e</anchor>
      <arglist>(Algorithm const &amp;algo, t_SetWeights const &amp;setweights, t_Reweightee const &amp;reweightee)</arglist>
    </member>
    <member kind="function">
      <type>Algorithm &amp;</type>
      <name>algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a274e791a7ca41de8bb3c32967d3fe273</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Algorithm &amp;</type>
      <name>algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>afeb5cdc1c80d3b37005c65d2e079d954</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; Algorithm &gt; &amp;</type>
      <name>algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>af68a3070ef6dcc52e0e32afd39525b2f</anchor>
      <arglist>(Algorithm const &amp;algo)</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; Algorithm &gt; &amp;</type>
      <name>algorithm</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>af8bb51293efa85820a73ee6ba4d60d14</anchor>
      <arglist>(Algorithm &amp;&amp;algo)</arglist>
    </member>
    <member kind="function">
      <type>const t_SetWeights &amp;</type>
      <name>set_weights</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a18cdd4af5127ad9137a685871bbf7576</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; Algorithm &gt; &amp;</type>
      <name>set_weights</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a519d0fc451b6bc7ef41947ff49fb899c</anchor>
      <arglist>(t_SetWeights const &amp;setweights) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_weights</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a06f99a0532b5f8814e341f874339f09e</anchor>
      <arglist>(Algorithm &amp;algo, WeightVector const &amp;weights) const</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; Algorithm &gt; &amp;</type>
      <name>reweightee</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>aca3c35d785e18434ae07ce5cd298e097</anchor>
      <arglist>(t_Reweightee const &amp;rw)</arglist>
    </member>
    <member kind="function">
      <type>const t_Reweightee &amp;</type>
      <name>reweightee</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>ae184bde6af702c7b01ba97d528985bc7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>XVector</type>
      <name>reweightee</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a1ac14c0753a711374d0de0f5f02d9b30</anchor>
      <arglist>(XVector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>itermax</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a0a1a3935d51fc8361c4a134c8d69af83</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Reweighted &amp;</type>
      <name>itermax</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a1a0ac4ab3c94945d0176f6d4212b092e</anchor>
      <arglist>(t_uint i)</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>min_delta</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>abb7824f4677b3c4e82c5daff79cc8996</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Reweighted &amp;</type>
      <name>min_delta</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a030c711934fd84eaea7e9319748851c4</anchor>
      <arglist>(Real min_delta)</arglist>
    </member>
    <member kind="function">
      <type>const t_IsConverged &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a1e209d3ab0e502833436d83af94a846f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Reweighted &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a51138feecd63a9df214c95d802415c8c</anchor>
      <arglist>(t_IsConverged const &amp;convergence)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a28449d4380b6ebf25201132bbaf8181d</anchor>
      <arglist>(XVector const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; not(std::is_same&lt; INPUT, typename Algorithm::DiagnosticAndResult &gt;::value or std::is_same&lt; INPUT, ReweightedResult &gt;::value), ReweightedResult &gt;::type</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a31f2e65cef4a072002ba2a8773f63bc8</anchor>
      <arglist>(INPUT const &amp;input) const</arglist>
    </member>
    <member kind="function">
      <type>ReweightedResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a5d077786db8bf14f092a3895da872cba</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ReweightedResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a0199703d77671ee544673765e95e800f</anchor>
      <arglist>(typename Algorithm::DiagnosticAndResult const &amp;warm) const</arglist>
    </member>
    <member kind="function">
      <type>ReweightedResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a858966419e7a03d753ab232a4620b323</anchor>
      <arglist>(ReweightedResult const &amp;warm) const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>update_delta</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>ac95decb5be98a11646002717ce179150</anchor>
      <arglist>(Real delta) const</arglist>
    </member>
    <member kind="function">
      <type>const t_DeltaUpdate &amp;</type>
      <name>update_delta</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>ac673ff8e4da0195e428561e03f15ce45</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; Algorithm &gt;</type>
      <name>update_delta</name>
      <anchorfile>classsopt_1_1algorithm_1_1Reweighted.html</anchorfile>
      <anchor>a98ec3ad03f985a4f954dff65a72bc250</anchor>
      <arglist>(t_DeltaUpdate const &amp;ud) const</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::algorithm::Reweighted::ReweightedResult</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1algorithm_1_1Reweighted_1_1ReweightedResult.html</filename>
    <member kind="function">
      <type></type>
      <name>ReweightedResult</name>
      <anchorfile>structsopt_1_1algorithm_1_1Reweighted_1_1ReweightedResult.html</anchorfile>
      <anchor>a432b81df466c77269c477fbe0572f450</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable">
      <type>t_uint</type>
      <name>niters</name>
      <anchorfile>structsopt_1_1algorithm_1_1Reweighted_1_1ReweightedResult.html</anchorfile>
      <anchor>a2f2936c443ddd6bde02d4241b8c43ec8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>good</name>
      <anchorfile>structsopt_1_1algorithm_1_1Reweighted_1_1ReweightedResult.html</anchorfile>
      <anchor>a952971b8f9c8ce5e8d8d3ff820ac70ad</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>WeightVector</type>
      <name>weights</name>
      <anchorfile>structsopt_1_1algorithm_1_1Reweighted_1_1ReweightedResult.html</anchorfile>
      <anchor>af6f1bdaaafbb48cee43d2af5dfc67748</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Algorithm::DiagnosticAndResult</type>
      <name>algo</name>
      <anchorfile>structsopt_1_1algorithm_1_1Reweighted_1_1ReweightedResult.html</anchorfile>
      <anchor>ae3d41329eec39d9a3bf5450ae1b8c479</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::Sampling</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1Sampling.html</filename>
    <member kind="function">
      <type></type>
      <name>Sampling</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>a09becc036c4d93d2d3c17bb09c76581f</anchor>
      <arglist>(t_uint size, std::vector&lt; t_uint &gt; const &amp;indices)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Sampling</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>a6b80118bdb469695742e26d0cf039f04</anchor>
      <arglist>(t_uint size, t_uint samples, RNG &amp;&amp;rng)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Sampling</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>a21d30fe3734b9f4e1d7bd98eb84575ee</anchor>
      <arglist>(t_uint size, t_uint samples)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>aa1d02cc7ff8e473d3b31f40b5cf83445</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T1 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>a81ab0049a5666623de29dc2428d48c1c</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;&amp;out, Eigen::DenseBase&lt; T1 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>adjoint</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>a58d40df0109df82a9f55d86ebc8f7f06</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T1 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>adjoint</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>a492d34ffc7e067d4f81d808c50617c09</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;&amp;out, Eigen::DenseBase&lt; T1 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>cols</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>ae674230d0bc02328f8adbac2688516e9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>rows</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>a982fbef95a3de73d8f28e5b16b9e4e95</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; t_uint &gt; &amp;</type>
      <name>indices</name>
      <anchorfile>classsopt_1_1Sampling.html</anchorfile>
      <anchor>ad9fc79cd57d75ccdb4d0c28a71791e69</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::wavelets::SARA</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1wavelets_1_1SARA.html</filename>
    <member kind="function">
      <type></type>
      <name>SARA</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>a8f0b43c6ee6e71f0332c46cd0c79d307</anchor>
      <arglist>(std::initializer_list&lt; std::tuple&lt; std::string, t_uint &gt;&gt; const &amp;init)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SARA</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>af10aa12c98e8f58956a74d78917d07e1</anchor>
      <arglist>(ITERATOR first, ITERATOR last)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SARA</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>a9947fa29eb60d9eee0aee2b489788237</anchor>
      <arglist>(const_iterator first, const_iterator last)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SARA</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>a9d7dcd6bca82967425593cee188a1c05</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>T0::PlainObject</type>
      <name>direct</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>aca7d6961dd6d81a86b58d51dc116a81d</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;signal) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>direct</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>af2c3b9fdb05bcd9d943670ed20d4f7d3</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; &amp;coefficients, Eigen::ArrayBase&lt; T0 &gt; const &amp;signal) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>direct</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>a5e3499abe1ac92e1bcc778fa38957f59</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; &amp;&amp;coefficients, Eigen::ArrayBase&lt; T0 &gt; const &amp;signal) const</arglist>
    </member>
    <member kind="function">
      <type>T0::PlainObject</type>
      <name>indirect</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>ac2fd83b869b5d95635afa97f5d990128</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>indirect</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>a7373cc0c58ff09315e484860a044150c</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; const &amp;coefficients, Eigen::ArrayBase&lt; T0 &gt; &amp;signal) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>indirect</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>afd3f0f5a46bad297845c134f22f7d4a3</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; const &amp;coeffs, Eigen::ArrayBase&lt; T0 &gt; &amp;&amp;signal) const</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>max_levels</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>a06e5d009ae02eae6738bf5cf58a3e87b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>emplace_back</name>
      <anchorfile>classsopt_1_1wavelets_1_1SARA.html</anchorfile>
      <anchor>a372d3908f026eb02c41c5d46462c0382</anchor>
      <arglist>(std::string const &amp;name, t_uint nlevels)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::ScalarRelativeVariation</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1ScalarRelativeVariation.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>TYPE</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>aab862d556d3b86f96c9c94cf07f3ec1e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a6d076ab2c26f8319e10721bd241d79ba</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ScalarRelativeVariation</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a559108afb236f41a879abab7e3d0c8f6</anchor>
      <arglist>(Real relative_tolerance=1e-12, Real absolute_tolerance=1e-12, std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ScalarRelativeVariation</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>ac6113ef6ef42ce4f7e6cb8e5c8a8f5c5</anchor>
      <arglist>(ScalarRelativeVariation const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a41b9a4c90b1ab86bbd32fd24261d14fb</anchor>
      <arglist>(Scalar const &amp;current)</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>relative_tolerance</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a19f8f90cb7fa840907f33c443d500a1a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RelativeVariation&lt; Scalar &gt; &amp;</type>
      <name>relative_tolerance</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>aed35ffb3df13bb41bf7612aa3f30f026</anchor>
      <arglist>(Real &amp;e) const</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>absolute_tolerance</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a5a9480912f7ce20e1a62e47f0f9cf6d6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RelativeVariation&lt; Scalar &gt; &amp;</type>
      <name>absolute_tolerance</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a075b09031649c045d731d61f53c27f64</anchor>
      <arglist>(Real &amp;e) const</arglist>
    </member>
    <member kind="function">
      <type>const std::string &amp;</type>
      <name>name</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a7c26a55aefbc6ab2ffc2b7343b5b8df1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const ScalarRelativeVariation &amp;</type>
      <name>name</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a549d6762b01e4a6f3e6c0bac17cc73e7</anchor>
      <arglist>(std::string const &amp;name) const</arglist>
    </member>
    <member kind="function">
      <type>Scalar</type>
      <name>previous</name>
      <anchorfile>classsopt_1_1ScalarRelativeVariation.html</anchorfile>
      <anchor>a8894355205404953c518b4f41fb61642</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::SDMM</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1SDMM.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::SDMM::Diagnostic</class>
    <class kind="struct">sopt::algorithm::SDMM::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>SCALAR</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aaa61b8e2160cd20c6864111da36574ca</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>value_type</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a69511914c6550ae3093f3b645a00748b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a7534aa081bd37c246412b6c0cb9b2749</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; SCALAR &gt;</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a65cd119773a58a8b59007f8e9637af8d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>LinearTransform&lt; t_Vector &gt;</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aabf1f7a9b2e77cc06e88db5e89b545cd</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ProximalFunction&lt; SCALAR &gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a9df7202b8ff882d8542e3c4fc5ad87a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ConvergenceFunction&lt; SCALAR &gt;</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aad9f3f2dd16782ebe3be31dc1d8813f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SDMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a3ee333f819de03f798fdbab2cc853720</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SDMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a223f868a6d4942481ec73fd5ddf19125</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>ae943e76e3b969689c24fc27206582875</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a9c3db437339afaaca7c92fb1c17b5cfd</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>af1d51e16acc08899489ab685e592ba5b</anchor>
      <arglist>(conjugate_gradient, ConjugateGradient)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>af5f01836bc2be8fe666a8a9886d76618</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; SCALAR &gt; &amp;</type>
      <name>conjugate_gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a70f1abe51c4ff2bce73bea0722e36b8c</anchor>
      <arglist>(t_uint itermax, t_real tolerance)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; SCALAR &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aa3987b5c30998d6e835d0a6df0698480</anchor>
      <arglist>(PROXIMAL proximal, T args)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; SCALAR &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a36dcb484e0b0e8d525097afa6c92612b</anchor>
      <arglist>(PROXIMAL proximal)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; SCALAR &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a2d9f494875836e25a5378f79b0ffb199</anchor>
      <arglist>(PROXIMAL proximal, L l, LADJOINT ladjoint)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; SCALAR &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a34ac68c91df5d54db91c2bdae70c7a03</anchor>
      <arglist>(PROXIMAL proximal, L l, LADJOINT ladjoint, std::array&lt; t_int, 3 &gt; sizes)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; SCALAR &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a01f6322e6a5a96e2c203902fbec4258f</anchor>
      <arglist>(PROXIMAL proximal, L l, std::array&lt; t_int, 3 &gt; dsizes, LADJOINT ladjoint, std::array&lt; t_int, 3 &gt; isizes)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a5825e7f91be7fafbfbaa8233be2f0f40</anchor>
      <arglist>(t_Vector &amp;out, t_Vector const &amp;input) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aca449d47a84ff0d1128928a3773cdeff</anchor>
      <arglist>(t_Vector const &amp;input) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>ad56680aa3fc84b5066cbae0b402edfa9</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; t_LinearTransform &gt; &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>ad357b58f97be461674b23c55d4486c1b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; t_LinearTransform &gt; &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aad29d43c052ba1b6ed104f6a9f321316</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const t_LinearTransform &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a156a6fd863556d724be7358804d107cf</anchor>
      <arglist>(t_uint i) const</arglist>
    </member>
    <member kind="function">
      <type>t_LinearTransform &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a72f1c67349052388f1df462ff3d13156</anchor>
      <arglist>(t_uint i)</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; t_Proximal &gt; &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a7541be755e7a26b12c3f51cd43a793ff</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; t_Proximal &gt; &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a45659fb80f0991caa599037a2905a29e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const t_Proximal &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a46b2ffa802374eebab4c171893bfbb90</anchor>
      <arglist>(t_uint i) const</arglist>
    </member>
    <member kind="function">
      <type>t_Proximal &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a5cb2bd4d57d71045c411d28479adaa30</anchor>
      <arglist>(t_uint i)</arglist>
    </member>
    <member kind="function">
      <type>proximal::ProximalExpression&lt; t_Proximal const &amp;, T0 &gt;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a31c6a56682bd4cd40278b044effc1c5e</anchor>
      <arglist>(t_uint i, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>size</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>acbac004a85088c219fa3082dda87d5f0</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>conjugate_gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a02eba238ac840cb97b0e5323dc236e68</anchor>
      <arglist>(T0 &amp;&amp;t0, T &amp;&amp;... args) const -&gt; decltype(this-&gt;conjugate_gradient()(std::forward&lt; T0 &gt;(t0), std::forward&lt; T &gt;(args)...))</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a1df28b4f66390bb64af39290b93cabb0</anchor>
      <arglist>(t_Vector const &amp;x) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SDMM&lt; Scalar &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1SDMM.html</filename>
    <member kind="typedef">
      <type>Scalar</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aaa61b8e2160cd20c6864111da36574ca</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>value_type</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a69511914c6550ae3093f3b645a00748b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename real_type&lt; Scalar &gt;::type</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a7534aa081bd37c246412b6c0cb9b2749</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Scalar &gt;</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a65cd119773a58a8b59007f8e9637af8d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>LinearTransform&lt; t_Vector &gt;</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aabf1f7a9b2e77cc06e88db5e89b545cd</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ProximalFunction&lt; Scalar &gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a9df7202b8ff882d8542e3c4fc5ad87a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ConvergenceFunction&lt; Scalar &gt;</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aad9f3f2dd16782ebe3be31dc1d8813f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SDMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a3ee333f819de03f798fdbab2cc853720</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SDMM</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a223f868a6d4942481ec73fd5ddf19125</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>ae943e76e3b969689c24fc27206582875</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a9c3db437339afaaca7c92fb1c17b5cfd</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>af1d51e16acc08899489ab685e592ba5b</anchor>
      <arglist>(conjugate_gradient, ConjugateGradient)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>af5f01836bc2be8fe666a8a9886d76618</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; Scalar &gt; &amp;</type>
      <name>conjugate_gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a70f1abe51c4ff2bce73bea0722e36b8c</anchor>
      <arglist>(t_uint itermax, t_real tolerance)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>conjugate_gradient</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a02eba238ac840cb97b0e5323dc236e68</anchor>
      <arglist>(T0 &amp;&amp;t0, T &amp;&amp;... args) const -&gt; decltype(this-&gt;conjugate_gradient()(std::forward&lt; T0 &gt;(t0), std::forward&lt; T &gt;(args)...))</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; Scalar &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aa3987b5c30998d6e835d0a6df0698480</anchor>
      <arglist>(PROXIMAL proximal, T args)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; Scalar &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a36dcb484e0b0e8d525097afa6c92612b</anchor>
      <arglist>(PROXIMAL proximal)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; Scalar &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a2d9f494875836e25a5378f79b0ffb199</anchor>
      <arglist>(PROXIMAL proximal, L l, LADJOINT ladjoint)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; Scalar &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a34ac68c91df5d54db91c2bdae70c7a03</anchor>
      <arglist>(PROXIMAL proximal, L l, LADJOINT ladjoint, std::array&lt; t_int, 3 &gt; sizes)</arglist>
    </member>
    <member kind="function">
      <type>SDMM&lt; Scalar &gt; &amp;</type>
      <name>append</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a01f6322e6a5a96e2c203902fbec4258f</anchor>
      <arglist>(PROXIMAL proximal, L l, std::array&lt; t_int, 3 &gt; dsizes, LADJOINT ladjoint, std::array&lt; t_int, 3 &gt; isizes)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a5825e7f91be7fafbfbaa8233be2f0f40</anchor>
      <arglist>(t_Vector &amp;out, t_Vector const &amp;input) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aca449d47a84ff0d1128928a3773cdeff</anchor>
      <arglist>(t_Vector const &amp;input) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>ad56680aa3fc84b5066cbae0b402edfa9</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; t_LinearTransform &gt; &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>ad357b58f97be461674b23c55d4486c1b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; t_LinearTransform &gt; &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>aad29d43c052ba1b6ed104f6a9f321316</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const t_LinearTransform &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a156a6fd863556d724be7358804d107cf</anchor>
      <arglist>(t_uint i) const</arglist>
    </member>
    <member kind="function">
      <type>t_LinearTransform &amp;</type>
      <name>transforms</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a72f1c67349052388f1df462ff3d13156</anchor>
      <arglist>(t_uint i)</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; t_Proximal &gt; &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a7541be755e7a26b12c3f51cd43a793ff</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; t_Proximal &gt; &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a45659fb80f0991caa599037a2905a29e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const t_Proximal &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a46b2ffa802374eebab4c171893bfbb90</anchor>
      <arglist>(t_uint i) const</arglist>
    </member>
    <member kind="function">
      <type>t_Proximal &amp;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a5cb2bd4d57d71045c411d28479adaa30</anchor>
      <arglist>(t_uint i)</arglist>
    </member>
    <member kind="function">
      <type>proximal::ProximalExpression&lt; t_Proximal const &amp;, T0 &gt;</type>
      <name>proximals</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a31c6a56682bd4cd40278b044effc1c5e</anchor>
      <arglist>(t_uint i, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>size</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>acbac004a85088c219fa3082dda87d5f0</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1SDMM.html</anchorfile>
      <anchor>a1df28b4f66390bb64af39290b93cabb0</anchor>
      <arglist>(t_Vector const &amp;x) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::TFGProximal</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1TFGProximal.html</filename>
    <templarg></templarg>
    <base>GProximal</base>
    <member kind="typedef">
      <type>ForwardBackward&lt; SCALAR &gt;</type>
      <name>FB</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a596de6d25fec19553936cc874ea8b918</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>abad886c15adc3724d101748a4dcaf669</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a1090aa5b8306692a482536d0b0058188</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a4a84feda70e76aaccf5a718607645170</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_Proximal</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a5a2ce70fcb5ab36b0d8a0b3b1ea060dd</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename FB::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>ab5a5e53eff1e665d5cb5ac0e7256afe7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TFGProximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a7bac2fe9a426854d0eb96f8149bef88d</anchor>
      <arglist>(std::string path)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TFGProximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>ae6d92dd58c619a6a5609e09635b7d112</anchor>
      <arglist>(std::string path, const int rows, const int cols)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~TFGProximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a006fc3e639234bb2a841c3c84e94066a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>log_message</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a78359a395a2fb5f9358a0a139c7f65e9</anchor>
      <arglist>() const override</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>proximal_norm</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a45f8b05c6ac90ef9be4971fedb40527b</anchor>
      <arglist>(t_Vector const &amp;x) const override</arglist>
    </member>
    <member kind="function">
      <type>t_Proximal</type>
      <name>proximal_function</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a9ac2ca8e4cc93369d482529ca792075e</anchor>
      <arglist>() const override</arglist>
    </member>
    <member kind="function">
      <type>const t_LinearTransform &amp;</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1TFGProximal.html</anchorfile>
      <anchor>a0d28b095fff87afde143674f34ba675d</anchor>
      <arglist>() const override</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>Eigen::internal::traits&lt; sopt::details::AppliedFunction&lt; FUNCTION, VECTOR &gt; &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/structEigen_1_1internal_1_1traits_3_01sopt_1_1details_1_1AppliedFunction_3_01FUNCTION_00_01VECTOR_01_4_01_4.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename VECTOR::PlainObject</type>
      <name>ReturnType</name>
      <anchorfile>structEigen_1_1internal_1_1traits_3_01sopt_1_1details_1_1AppliedFunction_3_01FUNCTION_00_01VECTOR_01_4_01_4.html</anchorfile>
      <anchor>a8d3b46a7b031302979e4affda5234612</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>Eigen::internal::traits&lt; sopt::proximal::details::DelayedProximalEnveloppeFunction&lt; FUNCTION, VECTOR &gt; &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/structEigen_1_1internal_1_1traits_3_01sopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFun79592fbe5478856d047186d1851c9c0b.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename VECTOR::PlainObject</type>
      <name>ReturnType</name>
      <anchorfile>structEigen_1_1internal_1_1traits_3_01sopt_1_1proximal_1_1details_1_1DelayedProximalEnveloppeFun79592fbe5478856d047186d1851c9c0b.html</anchorfile>
      <anchor>a42c31546ed85ef5f13c6c5587b51d7db</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>Eigen::internal::traits&lt; sopt::proximal::details::DelayedProximalFunction&lt; FUNCTION, VECTOR &gt; &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/structEigen_1_1internal_1_1traits_3_01sopt_1_1proximal_1_1details_1_1DelayedProximalFunction_3_01FUNCTION_00_01VECTOR_01_4_01_4.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename VECTOR::PlainObject</type>
      <name>ReturnType</name>
      <anchorfile>structEigen_1_1internal_1_1traits_3_01sopt_1_1proximal_1_1details_1_1DelayedProximalFunction_3_01FUNCTION_00_01VECTOR_01_4_01_4.html</anchorfile>
      <anchor>af211119bfec5bc92b9f9052abeb27e06</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::Translation</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1Translation.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Translation</name>
      <anchorfile>classsopt_1_1proximal_1_1Translation.html</anchorfile>
      <anchor>a4d7b73ff0f9a60020cda7e88f8bbf9a7</anchor>
      <arglist>(FUNCTION const &amp;func, T_VECTOR const &amp;trans)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_reference&lt; OUTPUT &gt;::value, void &gt;::type</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1Translation.html</anchorfile>
      <anchor>a01390fa59bef64792bd94216fe2d7895</anchor>
      <arglist>(OUTPUT out, typename real_type&lt; typename T0::Scalar &gt;::type const &amp;t, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1Translation.html</anchorfile>
      <anchor>ac233779d3ca4f96168c17e59a75ed5ae</anchor>
      <arglist>(Vector&lt; typename T0::Scalar &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type const &amp;t, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>ProximalExpression&lt; Translation&lt; FUNCTION, VECTOR &gt; const &amp;, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1Translation.html</anchorfile>
      <anchor>abedb92fd29f1f6e336594bc30a85ad0d</anchor>
      <arglist>(typename T0::Scalar const &amp;t, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::algorithm::TVPrimalDual</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1algorithm_1_1TVPrimalDual.html</filename>
    <templarg></templarg>
    <class kind="struct">sopt::algorithm::TVPrimalDual::Diagnostic</class>
    <class kind="struct">sopt::algorithm::TVPrimalDual::DiagnosticAndResult</class>
    <member kind="typedef">
      <type>typename PD::value_type</type>
      <name>value_type</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a51fb8480a1a0167180d79fb34db5730c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::Scalar</type>
      <name>Scalar</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a48e2e515fb2ec279edbdc5327436d09c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a065875c572ddb264ac5bfd9296cc78a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Vector</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a8db506832f3cccf979c6c3ac79d0793f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_LinearTransform</type>
      <name>t_LinearTransform</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a9ce08409aba17ed9051d762ce73d12e4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(t_Vector &amp;, const T &amp;, const t_Vector &amp;)&gt;</type>
      <name>t_Proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>aa677c25ebb469010ccc3fda4fef0435e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_IsConverged</type>
      <name>t_IsConverged</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a656b5b5c9ff6fe15adff101476ad2a3a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Constraint</type>
      <name>t_Constraint</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ab89548eb37b6df2c94c8fe4497e5cd32</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename PD::t_Random_Updater</type>
      <name>t_Random_Updater</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a1b6b708d989fdf5b2ee6b787fa929831</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TVPrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a0d91bb51cdde762e62524c288f8b45e5</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~TVPrimalDual</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ac61abc90b667751ad17fb399a31b341c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ab436861e122767befe5cbae5f3a3dd74</anchor>
      <arglist>(tv_proximal, t_Proximal&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a9afe5efef177f314da7ec255da7bee1e</anchor>
      <arglist>(tv_proximal_weighted, t_Proximal&lt; Vector&lt; Real &gt;&gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a7abce595c9bb69bf64d0fbada5adb7e3</anchor>
      <arglist>(tv_proximal_weights, Vector&lt; Real &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a0a51a303c790c7be0582994535388e9d</anchor>
      <arglist>(l2ball_proximal, proximal::WeightedL2Ball&lt; Scalar &gt;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a6c4f8d4f9eca0292a89f9a94b3a9e324</anchor>
      <arglist>(residual_tolerance, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a1eaa45f68a77355daea64dc48758996c</anchor>
      <arglist>(relative_variation, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a93adcac7635fe8f017784b73eb41ec3e</anchor>
      <arglist>(residual_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a269165a56ddaf93519a5d6eb6e8a1e43</anchor>
      <arglist>(objective_convergence, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a444e91dac5db43fe5a5d8be8744ab167</anchor>
      <arglist>(itermax, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a66b8089638be765f7b0f83485e9f54cd</anchor>
      <arglist>(gamma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a3c5558c361897b59fc7afa945455e42b</anchor>
      <arglist>(update_scale, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a9df7004b57e62e358f4e2198f0bbd725</anchor>
      <arglist>(positivity_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a7dfcd9f627e6dc57731e95f52aee0232</anchor>
      <arglist>(real_constraint, bool)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a4dca836c25e823c563fbe4ffb88061a9</anchor>
      <arglist>(sigma, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a7ea0e67309dd45189e1559ef8978493d</anchor>
      <arglist>(tau, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a46639900f75b61913e3bebf3556deae4</anchor>
      <arglist>(xi, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a8d818fe7bf141b419be886b8fce53a0c</anchor>
      <arglist>(rho, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ae2ca08e29e8b49b95a4df452490d0e5d</anchor>
      <arglist>(nu, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a0e9c844ef75de3048750f3457d9a0c21</anchor>
      <arglist>(precondition_stepsize, Real)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a50e9743c9a639960476eb63dd8aece7d</anchor>
      <arglist>(precondition_weights, t_Vector)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a5cbc502b7629f3d977412041cd10be64</anchor>
      <arglist>(precondition_iters, t_uint)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a6a6f1ad4a472ed02a556d23dedcba574</anchor>
      <arglist>(is_converged, t_IsConverged)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a4ae5228b206db31c85daca630a0912f9</anchor>
      <arglist>(Phi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ab3a6530c57ffb4503e9f122a8af951a6</anchor>
      <arglist>(Psi, t_LinearTransform)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a39b4c6b1a0e676b0d44e5eadd13e2061</anchor>
      <arglist>(random_measurement_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ad4d6b104b11fc90ef04f2898bcc74518</anchor>
      <arglist>(random_wavelet_updater, t_Random_Updater)</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a85751b4359397ba813589930b23826c9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>TVPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>target</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a0865dad0d18d348884ea28c68288d836</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a35c02a3d3c2c765b07c91d9b65e42d52</anchor>
      <arglist>(t_Vector &amp;out) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a616d264f6145913adcefdc322c0393f5</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>Diagnostic</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ab0a749fa54fb194b7400714e6268045b</anchor>
      <arglist>(t_Vector &amp;out, std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>acffd7d24b569a0171d2ed248c4670885</anchor>
      <arglist>(std::tuple&lt; t_Vector, t_Vector &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a8bcec86a3c531d07214d1b57810e61e8</anchor>
      <arglist>(std::tuple&lt; t_Vector const &amp;, t_Vector const &amp; &gt; const &amp;guess) const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a964c2302f69bd4deac05da198954d16e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>DiagnosticAndResult</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>abb5dd774422c493f25f7293f87458c8b</anchor>
      <arglist>(DiagnosticAndResult const &amp;warmstart) const</arglist>
    </member>
    <member kind="function">
      <type>TVPrimalDual &amp;::type</type>
      <name>Phi</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a49d06903cbb8a1af763f3e95821cf3e4</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>proximal::WeightedL2Ball&lt; Scalar &gt; &amp;</type>
      <name>l2ball_proximal</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ac273dffc98fd384b5586307e4cefba49</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>TVPrimalDual &amp;::type</type>
      <name>Psi</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ad0b7c219d64f734550e1696a178cd600</anchor>
      <arglist>(ARGS &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a13f3c14dbc377a0703d7c3768e3ac404</anchor>
      <arglist>(epsilon, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SOPT_MACRO</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a4ea0333bc052fbac4d3575c1bc737ca9</anchor>
      <arglist>(weights, l2ball, WeightedL2Ball)</arglist>
    </member>
    <member kind="function">
      <type>TVPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>residual_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>a770c4ef96ad15b97764855947253e1c8</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>TVPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>objective_convergence</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>ae82344a8b20e421d3f77627f906c95fe</anchor>
      <arglist>(Real const &amp;tolerance)</arglist>
    </member>
    <member kind="function">
      <type>TVPrimalDual&lt; Scalar &gt; &amp;</type>
      <name>is_converged</name>
      <anchorfile>classsopt_1_1algorithm_1_1TVPrimalDual.html</anchorfile>
      <anchor>aa820cffeae9c7c5fc820f505ca002842</anchor>
      <arglist>(std::function&lt; bool(t_Vector const &amp;x)&gt; const &amp;func)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::underlying_value_type</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1underlying__value__type.html</filename>
    <templarg></templarg>
    <templarg></templarg>
  </compound>
  <compound kind="class">
    <name>underlying_value_type&lt; SCALAR &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1underlying__value__type.html</filename>
  </compound>
  <compound kind="class">
    <name>underlying_value_type&lt; Scalar &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1underlying__value__type.html</filename>
  </compound>
  <compound kind="class">
    <name>underlying_value_type&lt; T &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1underlying__value__type.html</filename>
  </compound>
  <compound kind="class">
    <name>sopt::details::underlying_value_type&lt; T, false &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1underlying__value__type_3_01T_00_01false_01_4.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>T</type>
      <name>type</name>
      <anchorfile>classsopt_1_1details_1_1underlying__value__type_3_01T_00_01false_01_4.html</anchorfile>
      <anchor>a868eecca5c5885f2ac813fc06de45bfc</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::underlying_value_type&lt; T, true &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1underlying__value__type_3_01T_00_01true_01_4.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename underlying_value_type&lt; typename T::value_type &gt;::type</type>
      <name>type</name>
      <anchorfile>classsopt_1_1details_1_1underlying__value__type_3_01T_00_01true_01_4.html</anchorfile>
      <anchor>a845d34c20196a329028268320bc0e137</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::details::HasValueType::Fallback::value_type</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1details_1_1HasValueType_1_1Fallback_1_1value__type.html</filename>
  </compound>
  <compound kind="class">
    <name>sopt::wavelets::Wavelet</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1wavelets_1_1Wavelet.html</filename>
    <base>sopt::wavelets::WaveletData</base>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Wavelet</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a1beda386d2ceef067ed1702184e07855</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>direct</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>ad90de7f17794ccaaf0f61116563142b6</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;signal) const -&gt; decltype(direct_transform(signal, 1, *this))</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>direct</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a1eb737da7f2e3fd2d14e4d0b73e0114d</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; &amp;coefficients, Eigen::ArrayBase&lt; T0 &gt; const &amp;signal) const -&gt; decltype(direct_transform(coefficients, signal, 1, *this))</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>direct</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a89fdfab3b9a98e8e32f344773c08770f</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; &amp;&amp;coefficients, Eigen::ArrayBase&lt; T0 &gt; const &amp;signal) const -&gt; decltype(direct_transform(coefficients, signal, 1, *this))</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>indirect</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a639bf3e2ad12c13607b9636e18e88c7e</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coefficients) const -&gt; decltype(indirect_transform(coefficients, 1, *this))</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>indirect</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>ad1879ae333fbadf347a64faad1a4a2e4</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; const &amp;coefficients, Eigen::ArrayBase&lt; T0 &gt; &amp;signal) const -&gt; decltype(indirect_transform(coefficients, signal, 1, *this))</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>indirect</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a23d9ca3079c21ef56f6c158189bef6b4</anchor>
      <arglist>(Eigen::ArrayBase&lt; T1 &gt; const &amp;coeffs, Eigen::ArrayBase&lt; T0 &gt; &amp;&amp;signal) const -&gt; decltype(indirect_transform(coeffs, signal, 1, *this))</arglist>
    </member>
    <member kind="function">
      <type>t_uint</type>
      <name>levels</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a8e24de7cf07f155ef68a31e02dbd00ac</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>levels</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a0db95a400b0f852a488d133c06c5b35f</anchor>
      <arglist>(t_uint l)</arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend Wavelet</type>
      <name>factory</name>
      <anchorfile>classsopt_1_1wavelets_1_1Wavelet.html</anchorfile>
      <anchor>a127561e37a23c4cfde3ec8935ebded8f</anchor>
      <arglist>(std::string name, t_uint nlevels)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sopt::wavelets::WaveletData</name>
    <filename>http://astro-informatics.github.io/sopt/structsopt_1_1wavelets_1_1WaveletData.html</filename>
    <class kind="struct">sopt::wavelets::WaveletData::DirectFilter</class>
    <member kind="typedef">
      <type>t_real</type>
      <name>t_scalar</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>ab435424bac2f83bfa409820a2651f75e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Array&lt; t_real &gt;</type>
      <name>t_vector</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>abceb9fb7d565fff98658b51780120a37</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WaveletData</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>ad556d62aa40722ebc0a7886b97b6ca8e</anchor>
      <arglist>(std::initializer_list&lt; t_scalar &gt; const &amp;coefs)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WaveletData</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>a7b905f253994fed51c970b44603c4274</anchor>
      <arglist>(t_vector const &amp;coefs)</arglist>
    </member>
    <member kind="variable">
      <type>const t_vector</type>
      <name>coefficients</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>a16fa9561d38bbc42f65c7daa19b89f3d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>struct sopt::wavelets::WaveletData::DirectFilter</type>
      <name>direct_filter</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>ad4395dfd2205fe0ef0092802ca7c982c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_vector</type>
      <name>low_even</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>a0f6b5829d73e218244449151f24b6791</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_vector</type>
      <name>low_odd</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>a868a13c05474eca6518cee4b1e17526c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_vector</type>
      <name>high_even</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>a17c799c22df9e11b4e08fd2937eecfef</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_vector</type>
      <name>high_odd</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>adb051c8290b4f993e8e9294a4a7519fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>struct sopt::wavelets::WaveletData::@0</type>
      <name>indirect_filter</name>
      <anchorfile>structsopt_1_1wavelets_1_1WaveletData.html</anchorfile>
      <anchor>ac70b408207b67fb67820d48d85a7ce3e</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::proximal::WeightedL2Ball</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1proximal_1_1WeightedL2Ball.html</filename>
    <templarg></templarg>
    <base>sopt::proximal::L2Ball</base>
    <member kind="typedef">
      <type>typename L2Ball&lt; T &gt;::Real</type>
      <name>Real</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>afc532aaefb2b019879134b5876e55035</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Vector&lt; Real &gt;</type>
      <name>t_Vector</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>a04033cf6cdc1e404315ba1b3dd63bfdb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WeightedL2Ball</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>a6309396c45d9098c2f9229c3b7ae6e5d</anchor>
      <arglist>(Real epsilon, Eigen::DenseBase&lt; T0 &gt; const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WeightedL2Ball</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>a64d938dafc62ec5926c6d647491b5345</anchor>
      <arglist>(Real epsilon)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>a41211713ee2a30d954249f6453b20ac1</anchor>
      <arglist>(Vector&lt; T &gt; &amp;out, typename real_type&lt; T &gt;::type, Vector&lt; T &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>abbb7c987fbfbf78e785895c208759d00</anchor>
      <arglist>(Vector&lt; T &gt; &amp;out, Vector&lt; T &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>EnveloppeExpression&lt; WeightedL2Ball, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>ad026a8c792d4247d0b38b69c2de7b141</anchor>
      <arglist>(Real const &amp;, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>EnveloppeExpression&lt; WeightedL2Ball, T0 &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>a59fa94daaa62e7ffa1c8c4898b39f026</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>const t_Vector &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>a02bec372e3ce6a4dc518312a7f597083</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>WeightedL2Ball&lt; T &gt; &amp;</type>
      <name>weights</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>a2d05b25f0ce83c378a63b2c09a9882a8</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>Real</type>
      <name>epsilon</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>aeb8efb58d2879182c1a6ef5d88af947e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>WeightedL2Ball&lt; T &gt; &amp;</type>
      <name>epsilon</name>
      <anchorfile>classsopt_1_1proximal_1_1WeightedL2Ball.html</anchorfile>
      <anchor>abdff352ac2b299c1fa91adb576adde69</anchor>
      <arglist>(Real const &amp;eps)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sopt::details::WrapFunction</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1WrapFunction.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>OperatorFunction&lt; VECTOR &gt;</type>
      <name>t_Function</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a0f3e11172f290c6702faa27c02358741</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WrapFunction</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a260cef6252937e7fbd40f8ee987d81d7</anchor>
      <arglist>(t_Function const &amp;func, std::array&lt; t_int, 3 &gt; sizes={{1, 1, 0}})</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WrapFunction</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>ad4fb1f9a7bb3377d4b0721d32c08df47</anchor>
      <arglist>(WrapFunction const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WrapFunction</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a5283f37d26676f0b1f89e9bced25b858</anchor>
      <arglist>(WrapFunction const &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a0f8a03ef208d402e01d607cc687d2594</anchor>
      <arglist>(WrapFunction const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a8f3a718f07a80e994e6f803436f7eef1</anchor>
      <arglist>(WrapFunction &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::ArrayBase&lt; T0 &gt; &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>af4e07f29d0feeeb6611259b50ea9d419</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::ArrayBase&lt; T0 &gt; &gt;</type>
      <name>operator*</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a83abc6133bbf97e31f7fcc84ef30843e</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a1c88b36d4d82991e15a48d928383ae91</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>operator*</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a9f0ce49bf7d437dffdb609c82b9586ab</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>const std::array&lt; t_int, 3 &gt; &amp;</type>
      <name>sizes</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a5f72788d5be1218287fd3bd983f6c60d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_integral&lt; T &gt;::value, T &gt;::type</type>
      <name>rows</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a0976189d18a07d8b31b1fbc278c4b8aa</anchor>
      <arglist>(T xsize) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>WrapFunction&lt; t_Vector &gt;</name>
    <filename>http://astro-informatics.github.io/sopt/classsopt_1_1details_1_1WrapFunction.html</filename>
    <member kind="typedef">
      <type>OperatorFunction&lt; t_Vector &gt;</type>
      <name>t_Function</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a0f3e11172f290c6702faa27c02358741</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WrapFunction</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a260cef6252937e7fbd40f8ee987d81d7</anchor>
      <arglist>(t_Function const &amp;func, std::array&lt; t_int, 3 &gt; sizes={{1, 1, 0}})</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WrapFunction</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>ad4fb1f9a7bb3377d4b0721d32c08df47</anchor>
      <arglist>(WrapFunction const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>WrapFunction</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a5283f37d26676f0b1f89e9bced25b858</anchor>
      <arglist>(WrapFunction const &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a0f8a03ef208d402e01d607cc687d2594</anchor>
      <arglist>(WrapFunction const &amp;c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator=</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a8f3a718f07a80e994e6f803436f7eef1</anchor>
      <arglist>(WrapFunction &amp;&amp;c)</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::ArrayBase&lt; T0 &gt; &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>af4e07f29d0feeeb6611259b50ea9d419</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>operator()</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a1c88b36d4d82991e15a48d928383ae91</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::ArrayBase&lt; T0 &gt; &gt;</type>
      <name>operator*</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a83abc6133bbf97e31f7fcc84ef30843e</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>AppliedFunction&lt; t_Function const &amp;, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>operator*</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a9f0ce49bf7d437dffdb609c82b9586ab</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;x) const</arglist>
    </member>
    <member kind="function">
      <type>const std::array&lt; t_int, 3 &gt; &amp;</type>
      <name>sizes</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a5f72788d5be1218287fd3bd983f6c60d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_integral&lt; T &gt;::value, T &gt;::type</type>
      <name>rows</name>
      <anchorfile>classsopt_1_1details_1_1WrapFunction.html</anchorfile>
      <anchor>a0976189d18a07d8b31b1fbc278c4b8aa</anchor>
      <arglist>(T xsize) const</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>Eigen</name>
    <filename>http://astro-informatics.github.io/sopt/namespaceEigen.html</filename>
    <namespace>Eigen::internal</namespace>
  </compound>
  <compound kind="namespace">
    <name>Eigen::internal</name>
    <filename>http://astro-informatics.github.io/sopt/namespaceEigen_1_1internal.html</filename>
    <class kind="struct">Eigen::internal::traits&lt; sopt::details::AppliedFunction&lt; FUNCTION, VECTOR &gt; &gt;</class>
    <class kind="struct">Eigen::internal::traits&lt; sopt::proximal::details::DelayedProximalEnveloppeFunction&lt; FUNCTION, VECTOR &gt; &gt;</class>
    <class kind="struct">Eigen::internal::traits&lt; sopt::proximal::details::DelayedProximalFunction&lt; FUNCTION, VECTOR &gt; &gt;</class>
  </compound>
  <compound kind="namespace">
    <name>sopt</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt.html</filename>
    <namespace>sopt::algorithm</namespace>
    <namespace>sopt::cppflowutils</namespace>
    <namespace>sopt::credible_region</namespace>
    <namespace>sopt::details</namespace>
    <namespace>sopt::gradient_operator</namespace>
    <namespace>sopt::logging</namespace>
    <namespace>sopt::mpi</namespace>
    <namespace>sopt::notinstalled</namespace>
    <namespace>sopt::objective_functions</namespace>
    <namespace>sopt::proximal</namespace>
    <namespace>sopt::utilities</namespace>
    <namespace>sopt::wavelets</namespace>
    <class kind="struct">sopt::CData</class>
    <class kind="class">sopt::ConjugateGradient</class>
    <class kind="class">sopt::Exception</class>
    <class kind="struct">sopt::is_complex</class>
    <class kind="struct">sopt::is_complex&lt; std::complex&lt; T &gt;, void &gt;</class>
    <class kind="class">sopt::LinearTransform</class>
    <class kind="class">sopt::RelativeVariation</class>
    <class kind="class">sopt::Sampling</class>
    <class kind="class">sopt::ScalarRelativeVariation</class>
    <member kind="typedef">
      <type>details::underlying_value_type&lt; T &gt;</type>
      <name>real_type</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7ee75936aaae93251b12abb77c3e02aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>int</type>
      <name>t_int</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a47796df8f5f6bbffc226292ef1ca8196</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>size_t</type>
      <name>t_uint</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7237c0991f6ec8c2bbdab8929b564964</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>t_real</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a71bfb8f70b432862d3d654b9dcff77cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::complex&lt; t_real &gt;</type>
      <name>t_complex</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad24bc0cbf4f1391b3d1440213329d13f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Matrix&lt; T, Eigen::Dynamic, 1 &gt;</type>
      <name>Vector</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ac4dd3feebe1bf49ebd44d72b05064c19</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Matrix&lt; T, Eigen::Dynamic, Eigen::Dynamic &gt;</type>
      <name>Matrix</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>adedb6b3e862bd2968bf3026599121630</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Array&lt; T, Eigen::Dynamic, 1 &gt;</type>
      <name>Array</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a9de8d7c976f608fe47220203047b5cb8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Array&lt; T, Eigen::Dynamic, Eigen::Dynamic &gt;</type>
      <name>Image</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7d7971e5566e597eb907614917e30c78</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(VECTOR &amp;, VECTOR const &amp;)&gt;</type>
      <name>OperatorFunction</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aa4353f012100677172534381f2801fa9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; void(Vector&lt; SCALAR &gt; &amp;, typename real_type&lt; SCALAR &gt;::type, Vector&lt; SCALAR &gt; const &amp;)&gt;</type>
      <name>ProximalFunction</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>af924da011a36e574306ab72f9f423834</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::function&lt; bool(Vector&lt; SCALAR &gt; const &amp;)&gt;</type>
      <name>ConvergenceFunction</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>acc375c693a8c32c2a954d17a7773b7f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_same&lt; t_real, K &gt;::value, K &gt;::type</type>
      <name>bisection_method</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7574fac5dcbb3569bad1e0d08a553406</anchor>
      <arglist>(const K &amp;function_value, const std::function&lt; K(K)&gt; &amp;func, const K &amp;a, const K &amp;b, const t_real &amp;rel_convergence=1e-4)</arglist>
    </member>
    <member kind="function">
      <type>OperatorFunction&lt; T0 &gt;</type>
      <name>chained_operators</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5e8a990d75711b892ac8bf2f030d8c1e</anchor>
      <arglist>(OperatorFunction&lt; T0 &gt; const &amp;arg0, T const &amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>version</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aad09b58521217893f8f6bb076ade261b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; uint8_t, uint8_t, uint8_t &gt;</type>
      <name>version_tuple</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a67e58ea24374aec8759a251b307a0af4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>gitref</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ae1029fa88c4dddd856802462d2121deb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>default_logging_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a94d9972b630fd6d0e88a914eb3aaaeda</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>default_logger_name</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a7d4a92230a7a1fea0033bf12c848c2b8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>constexpr bool</type>
      <name>color_logger</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a8665e2e558cf502796c385e0b350d54d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>constexpr std::size_t</type>
      <name>number_of_threads_in_tests</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad1f7fdbcc2c8d7cdde37b39c2a14ddbb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a27b8391ddefe157e732bebe05696170e</anchor>
      <arglist>(OperatorFunction&lt; VECTOR &gt; const &amp;direct, OperatorFunction&lt; VECTOR &gt; const &amp;indirect, std::array&lt; t_int, 3 &gt; const &amp;sizes={{1, 1, 0}})</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a424b3b158a6f6c45c97eb244c688b429</anchor>
      <arglist>(OperatorFunction&lt; VECTOR &gt; const &amp;direct, std::array&lt; t_int, 3 &gt; const &amp;dsizes, OperatorFunction&lt; VECTOR &gt; const &amp;indirect, std::array&lt; t_int, 3 &gt; const &amp;isizes)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt; &amp;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a74ca3f91c20ceee3bb34066eda6824b8</anchor>
      <arglist>(LinearTransform&lt; VECTOR &gt; &amp;passthrough)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; VECTOR &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5d99abe8892d0073763dedb050b95dd3</anchor>
      <arglist>(details::WrapFunction&lt; VECTOR &gt; const &amp;direct, details::WrapFunction&lt; VECTOR &gt; const &amp;adjoint)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; typename DERIVED::Scalar &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a09baebf7a38995a5fde7f7b4130ddcbe</anchor>
      <arglist>(Eigen::MatrixBase&lt; DERIVED &gt; const &amp;A)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; SCALAR &gt; &gt;</type>
      <name>linear_transform_identity</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>abf425c6640b07e4b2718d0a0db4c9cdd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T::Scalar &gt;::type</type>
      <name>standard_deviation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a239b0c108ec581a5b5f0c39276aefad8</anchor>
      <arglist>(Eigen::ArrayBase&lt; T &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T::Scalar &gt;::type</type>
      <name>standard_deviation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a009292a23363f1e290a92ce6a2786065</anchor>
      <arglist>(Eigen::MatrixBase&lt; T &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_arithmetic&lt; SCALAR &gt;::value or is_complex&lt; SCALAR &gt;::value, SCALAR &gt;::type</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a6494afff8ee7f1196ff67ce646359d3e</anchor>
      <arglist>(SCALAR const &amp;x, typename real_type&lt; SCALAR &gt;::type const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::CwiseUnaryOp&lt; const details::ProjectPositiveQuadrant&lt; typename T::Scalar &gt;, const T &gt;</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a430768559bd58eab9a93942fb99d1918</anchor>
      <arglist>(Eigen::DenseBase&lt; T &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::CwiseUnaryOp&lt; const details::SoftThreshhold&lt; typename T::Scalar &gt;, const T &gt;</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ac02ea9b606e6a1eef171de3447c77bc1</anchor>
      <arglist>(Eigen::DenseBase&lt; T &gt; const &amp;input, typename real_type&lt; typename T::Scalar &gt;::type const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; std::is_arithmetic&lt; typename T0::Scalar &gt;::value and std::is_arithmetic&lt; typename T1::Scalar &gt;::value, Eigen::CwiseBinaryOp&lt; typename T0::Scalar(*)(typename T0::Scalar const &amp;, typename T1::Scalar const &amp;), const T0, const T1 &gt; &gt;::type</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a3047abf694788f24705a1c656a250510</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; const &amp;input, Eigen::DenseBase&lt; T1 &gt; const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; typename T0::Scalar &gt;::value and std::is_arithmetic&lt; typename T1::Scalar &gt;::value, Eigen::CwiseBinaryOp&lt; typename T0::Scalar(*)(typename T0::Scalar const &amp;, typename T0::Scalar const &amp;), const T0, decltype(std::declval&lt; const T1 &gt;).template cast&lt; typename T0::Scalar &gt;))&gt; &gt;::type</type>
      <name>soft_threshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aa14309c45de330f8915e1ffd75fa8164</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; const &amp;input, Eigen::DenseBase&lt; T1 &gt; const &amp;threshhold)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad992ab663c3f521cad1deff62844c4cc</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input, Eigen::ArrayBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a2db42dd287d02a4ff3ce6b7fa2f40857</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input, Eigen::MatrixBase&lt; T1 &gt; const &amp;weight)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aa8f62b39e20496c485d78f97f9afa3e4</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5dac30fa2304a47833ce101737cebdbb</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ae78479408b10b1fa67e712247d4eefec</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input, Eigen::ArrayBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a57c3c1377f0345d2d3a5e5e16ae824e4</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input, Eigen::MatrixBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>aaae7c4b4b28cf09cb81be6bdc78d2acd</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>acc5e68fec339ce3ea64dd578483c1a19</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a1f08c74e9b2cac9f30e52c2c6bdbd0f5</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input, Eigen::ArrayBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ae0a7db0a39348c31cdb1475fbeb26c84</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input, Eigen::MatrixBase&lt; T1 &gt; const &amp;weights)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a1967222064d29c760e307ece5da21168</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; typename T0::Scalar &gt;::type</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a96b301acf3c109ea862ff9e563d2a164</anchor>
      <arglist>(Eigen::MatrixBase&lt; T0 &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a57b3045c6210eedfab02fd8faf71c18a</anchor>
      <arglist>(Sampling const &amp;sampling)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a43b77806f4ddf6e970dbb6b03613e39f</anchor>
      <arglist>(wavelets::Wavelet const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a5e3985419d8cc35852bff69d403aef8a</anchor>
      <arglist>(wavelets::SARA const &amp;sara)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a2d9a54108659a468d1a4c2177d7a88b0</anchor>
      <arglist>(wavelets::Wavelet const &amp;wavelet, t_uint rows, t_uint cols=1)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>linear_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a9c445e577476358820c5cef07f4e3998</anchor>
      <arglist>(wavelets::SARA const &amp;sara, t_uint rows, t_uint cols=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a1f816b885c3c1e6e59760df6436c8111</anchor>
      <arglist>(void *out, void *in, void **data)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>adjoint_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a44810fe3a30c81d0c9c5c91dd60011f8</anchor>
      <arglist>(void *out, void *in, void **data)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>target</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a83a82628fe55e720accd252a72c7337c</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; T &gt;::type</type>
      <name>sigma</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>ad7fbfa0f1f262d124020ccaf5e6cb573</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>dirty</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a52a813b13ba02590f41062b84996e0d5</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image, RANDOM &amp;mersenne)</arglist>
    </member>
    <member kind="function">
      <type>real_type&lt; T &gt;::type</type>
      <name>epsilon</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt.html</anchorfile>
      <anchor>a974f99e567f8ac05a0fe5e50fbfd215b</anchor>
      <arglist>(sopt::LinearTransform&lt; Vector&lt; T &gt;&gt; const &amp;sampling, sopt::Image&lt; T &gt; const &amp;image)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::algorithm</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</filename>
    <class kind="class">sopt::algorithm::ForwardBackward</class>
    <class kind="class">sopt::algorithm::ImagingForwardBackward</class>
    <class kind="class">sopt::algorithm::ImagingPrimalDual</class>
    <class kind="class">sopt::algorithm::ImagingProximalADMM</class>
    <class kind="class">sopt::algorithm::JointMAP</class>
    <class kind="class">sopt::algorithm::L1GProximal</class>
    <class kind="class">sopt::algorithm::L2ForwardBackward</class>
    <class kind="class">sopt::algorithm::PositiveQuadrant</class>
    <class kind="class">sopt::algorithm::PowerMethod</class>
    <class kind="class">sopt::algorithm::PrimalDual</class>
    <class kind="class">sopt::algorithm::ProximalADMM</class>
    <class kind="class">sopt::algorithm::Reweighted</class>
    <class kind="class">sopt::algorithm::SDMM</class>
    <class kind="class">sopt::algorithm::TFGProximal</class>
    <class kind="class">sopt::algorithm::TVPrimalDual</class>
    <member kind="function">
      <type>PositiveQuadrant&lt; ALGORITHM &gt;</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a628797940cd6549ca3aecadbb22d9642</anchor>
      <arglist>(ALGORITHM const &amp;algo)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, T &gt;</type>
      <name>power_method</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a87e4a19b5c34cea6a2a490720d43a018</anchor>
      <arglist>(const sopt::LinearTransform&lt; T &gt; &amp;op, const t_uint niters, const t_real relative_difference, const T &amp;initial_vector)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, T, std::shared_ptr&lt; sopt::LinearTransform&lt; T &gt; &gt; &gt;</type>
      <name>normalise_operator</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a24d048a91054bfe01cf3b345c8783e9a</anchor>
      <arglist>(const std::shared_ptr&lt; sopt::LinearTransform&lt; T &gt; const &gt; &amp;op, const t_uint &amp;niters, const t_real &amp;relative_difference, const T &amp;initial_vector)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, T, sopt::LinearTransform&lt; T &gt; &gt;</type>
      <name>normalise_operator</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a565417b5171e614cc9faa5d503ee0a25</anchor>
      <arglist>(const sopt::LinearTransform&lt; T &gt; &amp;op, const t_uint &amp;niters, const t_real &amp;relative_difference, const T &amp;initial_vector)</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; ALGORITHM &gt;</type>
      <name>reweighted</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a9d90a51f2ae69e07e802df6d21c6e384</anchor>
      <arglist>(ALGORITHM const &amp;algo, typename Reweighted&lt; ALGORITHM &gt;::t_SetWeights const &amp;set_weights, typename Reweighted&lt; ALGORITHM &gt;::t_Reweightee const &amp;reweightee)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::CwiseUnaryOp&lt; const details::ProjectPositiveQuadrant&lt; typename T::Scalar &gt;, const T &gt;</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>ad1377b8328b6fc78bd779dc9b852c9d7</anchor>
      <arglist>(Eigen::DenseBase&lt; T &gt; const &amp;input)</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; PositiveQuadrant&lt; ImagingProximalADMM&lt; SCALAR &gt; &gt; &gt;</type>
      <name>reweighted</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a90f7859557f093f416e113d5acab1425</anchor>
      <arglist>(ImagingProximalADMM&lt; SCALAR &gt; const &amp;algo)</arglist>
    </member>
    <member kind="function">
      <type>Reweighted&lt; PositiveQuadrant&lt; PrimalDual&lt; SCALAR &gt; &gt; &gt;</type>
      <name>reweighted</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1algorithm.html</anchorfile>
      <anchor>a6b5cd6e5186a8b6581991f357b60203b</anchor>
      <arglist>(PrimalDual&lt; SCALAR &gt; const &amp;algo)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::cppflowutils</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</filename>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a3db2be4ce233b68cb59e14bb41479afa</anchor>
      <arglist>(sopt::Image&lt; double &gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a9dad4c45792a6d14f3cf6663e4cff776</anchor>
      <arglist>(Image&lt; std::complex&lt; double &gt;&gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a74317f4c5fdf3059f4b347a9d295221c</anchor>
      <arglist>(sopt::Vector&lt; double &gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>cppflow::tensor</type>
      <name>convert_image_to_tensor</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>afb0af3de2fb724ecce66672044e4c893</anchor>
      <arglist>(sopt::Vector&lt; std::complex&lt; double &gt;&gt; const &amp;image, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Map&lt; Eigen::Array&lt; double, Eigen::Dynamic, Eigen::Dynamic &gt; &gt;</type>
      <name>convert_tensor_to_image</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a4144b27a919c778ad025f61dbef1b8ca</anchor>
      <arglist>(std::vector&lt; float &gt; model_output, int image_rows, int image_cols)</arglist>
    </member>
    <member kind="variable">
      <type>const double</type>
      <name>imaginary_threshold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1cppflowutils.html</anchorfile>
      <anchor>a4974785f862defec690cf6e52f16f78b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::credible_region</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</filename>
    <member kind="function">
      <type>t_real</type>
      <name>compute_energy_upper_bound</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>ae7771317b2309a9557ff17a942c11a48</anchor>
      <arglist>(const t_real &amp;alpha, const Eigen::MatrixBase&lt; T &gt; &amp;solution, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; t_real, t_real, t_real &gt;</type>
      <name>find_credible_interval</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a5ceab114eb663ec516f67a9ef5e5b37b</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const std::tuple&lt; t_uint, t_uint, t_uint, t_uint &gt; &amp;region, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;energy_upperbound)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval_grid</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a0bc1aa04714cdc67760cdc70f90d6e26</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const t_uint &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;energy_upperbound)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval_grid</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a241ac6adc49c40d978928329209cf259</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const std::tuple&lt; t_uint, t_uint &gt; &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;energy_upperbound)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>af57d455af6cd9b99c79b033693dce0f8</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const t_uint &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;alpha)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; is_complex&lt; K &gt;::value or std::is_arithmetic&lt; K &gt;::value, std::tuple&lt; Image&lt; K &gt;, Image&lt; K &gt;, Image&lt; K &gt; &gt; &gt;::type</type>
      <name>credible_interval</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1credible__region.html</anchorfile>
      <anchor>a3265c7688a2a6d5331ed40bccc88ff72</anchor>
      <arglist>(const Eigen::MatrixBase&lt; T &gt; &amp;solution, const t_uint &amp;rows, const t_uint &amp;cols, const std::tuple&lt; t_uint, t_uint &gt; &amp;grid_pixel_size, const std::function&lt; t_real(typename T::PlainObject)&gt; &amp;objective_function, const t_real &amp;alpha)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::details</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1details.html</filename>
    <class kind="class">sopt::details::AppliedFunction</class>
    <class kind="class">sopt::details::has_value_type</class>
    <class kind="class">sopt::details::has_value_type&lt; T, false &gt;</class>
    <class kind="class">sopt::details::has_value_type&lt; T, true &gt;</class>
    <class kind="struct">sopt::details::HasValueType</class>
    <class kind="struct">sopt::details::HasValueType&lt; T, typename std::enable_if&lt; std::is_fundamental&lt; T &gt;::value &gt;::type &gt;</class>
    <class kind="class">sopt::details::MatrixAdjointToLinearTransform</class>
    <class kind="class">sopt::details::MatrixToLinearTransform</class>
    <class kind="class">sopt::details::ProjectPositiveQuadrant</class>
    <class kind="class">sopt::details::ProjectPositiveQuadrant&lt; std::complex&lt; SCALAR &gt; &gt;</class>
    <class kind="class">sopt::details::underlying_value_type</class>
    <class kind="class">sopt::details::underlying_value_type&lt; T, false &gt;</class>
    <class kind="class">sopt::details::underlying_value_type&lt; T, true &gt;</class>
    <class kind="class">sopt::details::WrapFunction</class>
    <member kind="typedef">
      <type>decltype(std::bind(soft_threshhold&lt; SCALAR &gt;, std::placeholders::_1, typename real_type&lt; SCALAR &gt;::type(1)))</type>
      <name>SoftThreshhold</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1details.html</anchorfile>
      <anchor>a9b2c8778a2d73aff0499c9f899fe16df</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>t_int</type>
      <name>gcd</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1details.html</anchorfile>
      <anchor>a19d03d9b49ed12e7f7b91cb8b19e1db2</anchor>
      <arglist>(t_int a, t_int b)</arglist>
    </member>
    <member kind="function">
      <type>WrapFunction&lt; VECTOR &gt;</type>
      <name>wrap</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1details.html</anchorfile>
      <anchor>aa242c492d8954838a773f75c5a274729</anchor>
      <arglist>(OperatorFunction&lt; VECTOR &gt; const &amp;func, std::array&lt; t_int, 3 &gt; sizes={{1, 1, 0}})</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::gradient_operator</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</filename>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>a8f7157c3257d858e8a82b16a25f1c60d</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff_adjoint</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>a8c233ee4010dcf7b636342250c83a91c</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff2d</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>a713bf397493dd700519c0d5a45085f89</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x, const t_int rows, const t_int cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt;</type>
      <name>diff2d_adjoint</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>aa259c5bc7116336d24744351d364e260</anchor>
      <arglist>(const Vector&lt; T &gt; &amp;x, const t_int rows, const t_int cols)</arglist>
    </member>
    <member kind="function">
      <type>LinearTransform&lt; Vector&lt; T &gt; &gt;</type>
      <name>gradient_operator</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1gradient__operator.html</anchorfile>
      <anchor>aa02bf3cc5fc1c24460d2173269d27b57</anchor>
      <arglist>(const t_int rows, const t_int cols)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::logging</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</filename>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>initialize</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a120bb1caf65f04fc7d86c0914bb68713</anchor>
      <arglist>(std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>initialize</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>aa7efdb8dfaa270a5ee5915c08a64ebaa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>get</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a9f0cee3c49d8f62c122e5f83dddd610d</anchor>
      <arglist>(std::string const &amp;name=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; int &gt;</type>
      <name>get</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a5109e37f29d40ef6695c4291fcbb063d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a1a3ff36211cc8e01a397f484fb967f41</anchor>
      <arglist>(std::string const &amp;level, std::string const &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a7f2d11c952cce70b2a92c7402c14d2f6</anchor>
      <arglist>(std::string const &amp;)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>has_level</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>adfbe0795d12d3119704baf0f64dc9d3c</anchor>
      <arglist>(std::string const &amp;, std::string const &amp;)</arglist>
    </member>
    <member kind="variable">
      <type>const std::string</type>
      <name>name_prefix</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1logging.html</anchorfile>
      <anchor>a6c538b24670a61401f0fabf038e07931</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::mpi</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</filename>
    <namespace>sopt::mpi::details</namespace>
    <member kind="function">
      <type>std::shared_ptr&lt; details::initializer &gt;</type>
      <name>init</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>ad052cd83bbb11581f623f15e2a97b796</anchor>
      <arglist>(int argc, const char **argv)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; details::initializer &gt;</type>
      <name>session_singleton</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>a9f86b7b10e3a957b50d295c7b9a2040a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>initialized</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>ad44f35d3f51dfcc0fc3b40867f9dd6f3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>finalized</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>a92069429796f1e2f2263162af26bbdb7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>finalize</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi.html</anchorfile>
      <anchor>abfd53bf09013dc265c50e4c1ca0773e5</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::mpi::details</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1mpi_1_1details.html</filename>
  </compound>
  <compound kind="namespace">
    <name>sopt::notinstalled</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</filename>
    <member kind="function">
      <type>std::string</type>
      <name>data_directory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a1fcff7fb7b9de6604362ab009611d37f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>output_directory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a41591b69e6406ef3a36ded99be530efd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>models_directory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a2fa3d08c375b7e60e38382025a454314</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Image</type>
      <name>read_standard_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1notinstalled.html</anchorfile>
      <anchor>a3008033a62397de1c2e272b6caab6648</anchor>
      <arglist>(std::string const &amp;name)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::objective_functions</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</filename>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a05459b3a0a0e163d2501deca1bf0c4ad</anchor>
      <arglist>(const std::function&lt; t_real(T)&gt; &amp;g, const t_real &amp;sig, const T &amp;y, const sopt::OperatorFunction&lt; T &gt; &amp;measurement_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_L1_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a5038115d2ed074e7239812b338d57524</anchor>
      <arglist>(const t_real &amp;gamma, const t_real &amp;sig, const T &amp;y, const sopt::OperatorFunction&lt; T &gt; &amp;measurement_operator, const sopt::LinearTransform&lt; T &gt; &amp;wavelet_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a0ff3f5cdedb39448a8fba43492413872</anchor>
      <arglist>(const std::function&lt; t_real(T)&gt; &amp;g, const t_real &amp;sig, const T &amp;y, const sopt::LinearTransform&lt; T &gt; &amp;measurement_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_l1_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a121b17bc750fe21815f86cc3d790c3a3</anchor>
      <arglist>(const t_real &amp;gamma, const t_real &amp;sig, const T &amp;y, const sopt::LinearTransform&lt; T &gt; &amp;measurement_operator, const sopt::LinearTransform&lt; T &gt; &amp;wavelet_operator)</arglist>
    </member>
    <member kind="function">
      <type>const std::function&lt; t_real(T)&gt;</type>
      <name>unconstrained_l1_regularisation</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1objective__functions.html</anchorfile>
      <anchor>a8df7f628fc3eb79b95e541a6dd40e256</anchor>
      <arglist>(const t_real &amp;gamma, const t_real &amp;sig, const T &amp;y, const sopt::OperatorFunction&lt; T &gt; &amp;measurement_operator, const sopt::LinearTransform&lt; T &gt; &amp;wavelet_operator)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::proximal</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</filename>
    <namespace>sopt::proximal::details</namespace>
    <class kind="class">sopt::proximal::EuclidianNorm</class>
    <class kind="class">sopt::proximal::L1</class>
    <class kind="class">sopt::proximal::L1TightFrame</class>
    <class kind="class">sopt::proximal::L2Ball</class>
    <class kind="class">sopt::proximal::L2Norm</class>
    <class kind="class">sopt::proximal::Translation</class>
    <class kind="class">sopt::proximal::WeightedL2Ball</class>
    <member kind="typedef">
      <type>details::DelayedProximalFunction&lt; FUNC, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>ProximalExpression</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>afc69dd3459e51c1420b9ed6823380cb9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>details::DelayedProximalEnveloppeFunction&lt; FUNC, Eigen::MatrixBase&lt; T0 &gt; &gt;</type>
      <name>EnveloppeExpression</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a88919b4345cfb37ca55835bb09b1b1e2</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>euclidian_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a8180be6d4895ccd9238026edcd34f29c</anchor>
      <arglist>(typename real_type&lt; typename T0::Scalar &gt;::type const &amp;t, Eigen::MatrixBase&lt; T0 &gt; const &amp;x) -&gt; decltype(EuclidianNorm(), t, x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>acaa892cd8aec7d5e6c4f24192cbca062</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>ad54f6b698f54216589e33fa3a524952e</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T2 &gt; const &amp;gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a539249fec2aa941ca7eb05a2c781cf2f</anchor>
      <arglist>(Vector&lt; S &gt; &amp;out, typename real_type&lt; S &gt;::type gamma, Vector&lt; S &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a0a6be3a9f2561a2052ce5c360050d3eb</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>l2_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>ae20cac74655c396bc0d68bdbc32dfcc4</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T2 &gt; const &amp;gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a73e1a321c1a8cab8911d645554df46f7</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tv_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a83cc90cb666c06a40790b8b9838e3c6f</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, Eigen::DenseBase&lt; T2 &gt; const &amp;gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>id</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a22e3b74782df4c0aa0058babbc4ddd89</anchor>
      <arglist>(Eigen::DenseBase&lt; T0 &gt; &amp;out, typename real_type&lt; typename T0::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T1 &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>l1_norm</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>af3353b451839ced4b6d7161ac18e13ba</anchor>
      <arglist>(typename real_type&lt; typename T::Scalar &gt;::type gamma, Eigen::DenseBase&lt; T &gt; const &amp;x) -&gt; decltype(sopt::soft_threshhold(x, gamma))</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>positive_quadrant</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a53e4faa743a776d115e18d70de58e9eb</anchor>
      <arglist>(Vector&lt; T &gt; &amp;out, typename real_type&lt; T &gt;::type, Vector&lt; T &gt; const &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>Translation&lt; FUNCTION, VECTOR &gt;</type>
      <name>translate</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal.html</anchorfile>
      <anchor>a17596cc6d16f2509de806a199fd2f5a9</anchor>
      <arglist>(FUNCTION const &amp;func, VECTOR const &amp;translation)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::proximal::details</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1proximal_1_1details.html</filename>
    <class kind="class">sopt::proximal::details::DelayedProximalEnveloppeFunction</class>
    <class kind="class">sopt::proximal::details::DelayedProximalFunction</class>
  </compound>
  <compound kind="namespace">
    <name>sopt::utilities</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</filename>
    <member kind="function">
      <type>Image</type>
      <name>read_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a571717c98b97e19d3d47d8507bb32a8a</anchor>
      <arglist>(std::string const &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write_tiff</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a18ac636e4a560294191b1066bc3599b4</anchor>
      <arglist>(Image&lt;&gt; const &amp;image, std::string const &amp;filename)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_basis_coefficients</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>aa690cbbff2973dae8e221bb19cf332cd</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint basis_index, const t_uint size)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_levels_1d</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>abe7ef9c993cc849d157658b7d0d9d63a</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint size)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_levels</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>ae362dbe5fcf8ca55344a1533c5f1c0af</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_low_high_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a9f44047b4c3854813cc5e83a6eb6273e</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_high_high_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>ae5cc489dc715100095239589273d58b4</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_high_low_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>aa259ba9a268fbd1019e24fd5df69458e</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_low_low_pass</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a39d2d28fadb120962c1bfb9ca9009b20</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint rows, const t_uint cols)</arglist>
    </member>
    <member kind="function">
      <type>Vector&lt; T &gt; &amp;</type>
      <name>get_wavelet_high_pass_1d</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1utilities.html</anchorfile>
      <anchor>a4f4b5626396dbc7fba8c06d64be6f7f4</anchor>
      <arglist>(Vector&lt; T &gt; &amp;coeffs, const t_uint level, const t_uint size)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sopt::wavelets</name>
    <filename>http://astro-informatics.github.io/sopt/http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</filename>
    <class kind="class">sopt::wavelets::SARA</class>
    <class kind="class">sopt::wavelets::Wavelet</class>
    <class kind="struct">sopt::wavelets::WaveletData</class>
    <member kind="function">
      <type>std::enable_if&lt; T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a378f59ac3ce43c1f2e81fc6480efc8df</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; &amp;coeffs, Eigen::ArrayBase&lt; T1 &gt; const &amp;signal, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; not T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acfff953dbab406985efac546d60c5edc</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs_, Eigen::ArrayBase&lt; T1 &gt; const &amp;signal, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>direct_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a3c43c452d5929aff9d653d27ac25a7d1</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;signal, t_uint levels, WaveletData const &amp;wavelet) -&gt; decltype(copy(signal))</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>indirect_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aeceb4851a94ee330e349d09b2c19e8dd</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs, Eigen::ArrayBase&lt; T1 &gt; &amp;signal, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>std::enable_if&lt; not T1::IsVectorAtCompileTime, void &gt;::type</type>
      <name>indirect_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a4f8c686a731306166b3bc0246f147cb4</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs_, Eigen::ArrayBase&lt; T1 &gt; const &amp;signal_, t_uint levels, WaveletData const &amp;wavelet)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>indirect_transform</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a808c93ad7353dbae45321d9163d8541f</anchor>
      <arglist>(Eigen::ArrayBase&lt; T0 &gt; const &amp;coeffs, t_uint levels, WaveletData const &amp;wavelet) -&gt; decltype(copy(coeffs))</arglist>
    </member>
    <member kind="function">
      <type>const WaveletData &amp;</type>
      <name>daubechies_data</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>af4b021fa0322242bb199585c12803a0e</anchor>
      <arglist>(t_uint)</arglist>
    </member>
    <member kind="function">
      <type>Wavelet</type>
      <name>factory</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a65aedf4b737bb07c94642b42fe99bfab</anchor>
      <arglist>(std::string name=&quot;DB1&quot;, t_uint nlevels=1)</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies1</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a4d4743b54ba49eb44d47c3d0793a674b</anchor>
      <arglist>({7.071067811865475244008443621048490392848359376884740365883398e-01, 7.071067811865475244008443621048490392848359376884740365883398e-01})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies2</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a5002592a2dd383b15ea52305a17fb5e1</anchor>
      <arglist>({4.829629131445341433748715998644486838169524195042022752011715e-01, 8.365163037378079055752937809168732034593703883484392934953414e-01, 2.241438680420133810259727622404003554678835181842717613871683e-01, -1.294095225512603811744494188120241641745344506599652569070016e-01})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies3</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a66be4d3ea7f402f02b943b83f9d703c4</anchor>
      <arglist>({3.326705529500826159985115891390056300129233992450683597084705e-01, 8.068915093110925764944936040887134905192973949948236181650920e-01, 4.598775021184915700951519421476167208081101774314923066433867e-01, -1.350110200102545886963899066993744805622198452237811919756862e-01, -8.544127388202666169281916918177331153619763898808662976351748e-02, 3.522629188570953660274066471551002932775838791743161039893406e-02})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies4</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a9363f72a1a22e2591c841af8b7f71716</anchor>
      <arglist>({2.303778133088965008632911830440708500016152482483092977910968e-01, 7.148465705529156470899219552739926037076084010993081758450110e-01, 6.308807679298589078817163383006152202032229226771951174057473e-01, -2.798376941685985421141374718007538541198732022449175284003358e-02, -1.870348117190930840795706727890814195845441743745800912057770e-01, 3.084138183556076362721936253495905017031482172003403341821219e-02, 3.288301166688519973540751354924438866454194113754971259727278e-02, -1.059740178506903210488320852402722918109996490637641983484974e-02})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies5</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a065624b1f6a4a1467a10aeb0d364026b</anchor>
      <arglist>({1.601023979741929144807237480204207336505441246250578327725699e-01, 6.038292697971896705401193065250621075074221631016986987969283e-01, 7.243085284377729277280712441022186407687562182320073725767335e-01, 1.384281459013207315053971463390246973141057911739561022694652e-01, -2.422948870663820318625713794746163619914908080626185983913726e-01, -3.224486958463837464847975506213492831356498416379847225434268e-02, 7.757149384004571352313048938860181980623099452012527983210146e-02, -6.241490212798274274190519112920192970763557165687607323417435e-03, -1.258075199908199946850973993177579294920459162609785020169232e-02, 3.335725285473771277998183415817355747636524742305315099706428e-03})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies6</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ae89c2e3569ac3218f56f5094b5235e68</anchor>
      <arglist>({1.115407433501094636213239172409234390425395919844216759082360e-01, 4.946238903984530856772041768778555886377863828962743623531834e-01, 7.511339080210953506789344984397316855802547833382612009730420e-01, 3.152503517091976290859896548109263966495199235172945244404163e-01, -2.262646939654398200763145006609034656705401539728969940143487e-01, -1.297668675672619355622896058765854608452337492235814701599310e-01, 9.750160558732304910234355253812534233983074749525514279893193e-02, 2.752286553030572862554083950419321365738758783043454321494202e-02, -3.158203931748602956507908069984866905747953237314842337511464e-02, 5.538422011614961392519183980465012206110262773864964295476524e-04, 4.777257510945510639635975246820707050230501216581434297593254e-03, -1.077301085308479564852621609587200035235233609334419689818580e-03})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies7</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a49702bd7d22aceaaf286facf7bf264e5</anchor>
      <arglist>({7.785205408500917901996352195789374837918305292795568438702937e-02, 3.965393194819173065390003909368428563587151149333287401110499e-01, 7.291320908462351199169430703392820517179660611901363782697715e-01, 4.697822874051931224715911609744517386817913056787359532392529e-01, -1.439060039285649754050683622130460017952735705499084834401753e-01, -2.240361849938749826381404202332509644757830896773246552665095e-01, 7.130921926683026475087657050112904822711327451412314659575113e-02, 8.061260915108307191292248035938190585823820965629489058139218e-02, -3.802993693501441357959206160185803585446196938467869898283122e-02, -1.657454163066688065410767489170265479204504394820713705239272e-02, 1.255099855609984061298988603418777957289474046048710038411818e-02, 4.295779729213665211321291228197322228235350396942409742946366e-04, -1.801640704047490915268262912739550962585651469641090625323864e-03, 3.537137999745202484462958363064254310959060059520040012524275e-04})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies8</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ad5b012ac414bf584f93a967604fe64f8</anchor>
      <arglist>({5.441584224310400995500940520299935503599554294733050397729280e-02, 3.128715909142999706591623755057177219497319740370229185698712e-01, 6.756307362972898068078007670471831499869115906336364227766759e-01, 5.853546836542067127712655200450981944303266678053369055707175e-01, -1.582910525634930566738054787646630415774471154502826559735335e-02, -2.840155429615469265162031323741647324684350124871451793599204e-01, 4.724845739132827703605900098258949861948011288770074644084096e-04, 1.287474266204784588570292875097083843022601575556488795577000e-01, -1.736930100180754616961614886809598311413086529488394316977315e-02, -4.408825393079475150676372323896350189751839190110996472750391e-02, 1.398102791739828164872293057263345144239559532934347169146368e-02, 8.746094047405776716382743246475640180402147081140676742686747e-03, -4.870352993451574310422181557109824016634978512157003764736208e-03, -3.917403733769470462980803573237762675229350073890493724492694e-04, 6.754494064505693663695475738792991218489630013558432103617077e-04, -1.174767841247695337306282316988909444086693950311503927620013e-04})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies9</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa97d9eedea667446d99dff6e97781729</anchor>
      <arglist>({3.807794736387834658869765887955118448771714496278417476647192e-02, 2.438346746125903537320415816492844155263611085609231361429088e-01, 6.048231236901111119030768674342361708959562711896117565333713e-01, 6.572880780513005380782126390451732140305858669245918854436034e-01, 1.331973858250075761909549458997955536921780768433661136154346e-01, -2.932737832791749088064031952421987310438961628589906825725112e-01, -9.684078322297646051350813353769660224825458104599099679471267e-02, 1.485407493381063801350727175060423024791258577280603060771649e-01, 3.072568147933337921231740072037882714105805024670744781503060e-02, -6.763282906132997367564227482971901592578790871353739900748331e-02, 2.509471148314519575871897499885543315176271993709633321834164e-04, 2.236166212367909720537378270269095241855646688308853754721816e-02, -4.723204757751397277925707848242465405729514912627938018758526e-03, -4.281503682463429834496795002314531876481181811463288374860455e-03, 1.847646883056226476619129491125677051121081359600318160732515e-03, 2.303857635231959672052163928245421692940662052463711972260006e-04, -2.519631889427101369749886842878606607282181543478028214134265e-04, 3.934732031627159948068988306589150707782477055517013507359938e-05})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies10</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ad672cb3f1a5b61249f47526b9e7ddffc</anchor>
      <arglist>({2.667005790055555358661744877130858277192498290851289932779975e-02, 1.881768000776914890208929736790939942702546758640393484348595e-01, 5.272011889317255864817448279595081924981402680840223445318549e-01, 6.884590394536035657418717825492358539771364042407339537279681e-01, 2.811723436605774607487269984455892876243888859026150413831543e-01, -2.498464243273153794161018979207791000564669737132073715013121e-01, -1.959462743773770435042992543190981318766776476382778474396781e-01, 1.273693403357932600826772332014009770786177480422245995563097e-01, 9.305736460357235116035228983545273226942917998946925868063974e-02, -7.139414716639708714533609307605064767292611983702150917523756e-02, -2.945753682187581285828323760141839199388200516064948779769654e-02, 3.321267405934100173976365318215912897978337413267096043323351e-02, 3.606553566956169655423291417133403299517350518618994762730612e-03, -1.073317548333057504431811410651364448111548781143923213370333e-02, 1.395351747052901165789318447957707567660542855688552426721117e-03, 1.992405295185056117158742242640643211762555365514105280067936e-03, -6.858566949597116265613709819265714196625043336786920516211903e-04, -1.164668551292854509514809710258991891527461854347597362819235e-04, 9.358867032006959133405013034222854399688456215297276443521873e-05, -1.326420289452124481243667531226683305749240960605829756400674e-05})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies11</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acd532afe928ff0db33723de2908ed2bc</anchor>
      <arglist>({1.869429776147108402543572939561975728967774455921958543286692e-02, 1.440670211506245127951915849361001143023718967556239604318852e-01, 4.498997643560453347688940373853603677806895378648933474599655e-01, 6.856867749162005111209386316963097935940204964567703495051589e-01, 4.119643689479074629259396485710667307430400410187845315697242e-01, -1.622752450274903622405827269985511540744264324212130209649667e-01, -2.742308468179469612021009452835266628648089521775178221905778e-01, 6.604358819668319190061457888126302656753142168940791541113457e-02, 1.498120124663784964066562617044193298588272420267484653796909e-01, -4.647995511668418727161722589023744577223260966848260747450320e-02, -6.643878569502520527899215536971203191819566896079739622858574e-02, 3.133509021904607603094798408303144536358105680880031964936445e-02, 2.084090436018106302294811255656491015157761832734715691126692e-02, -1.536482090620159942619811609958822744014326495773000120205848e-02, -3.340858873014445606090808617982406101930658359499190845656731e-03, 4.928417656059041123170739741708273690285547729915802418397458e-03, -3.085928588151431651754590726278953307180216605078488581921562e-04, -8.930232506662646133900824622648653989879519878620728793133358e-04, 2.491525235528234988712216872666801088221199302855425381971392e-04, 5.443907469936847167357856879576832191936678525600793978043688e-05, -3.463498418698499554128085159974043214506488048233458035943601e-05, 4.494274277236510095415648282310130916410497987383753460571741e-06})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies12</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a1cebeab9fc170856eeb61aa5699aad60</anchor>
      <arglist>({1.311225795722951750674609088893328065665510641931325007748280e-02, 1.095662728211851546057045050248905426075680503066774046383657e-01, 3.773551352142126570928212604879206149010941706057526334705839e-01, 6.571987225793070893027611286641169834250203289988412141394281e-01, 5.158864784278156087560326480543032700677693087036090056127647e-01, -4.476388565377462666762747311540166529284543631505924139071704e-02, -3.161784537527855368648029353478031098508839032547364389574203e-01, -2.377925725606972768399754609133225784553366558331741152482612e-02, 1.824786059275796798540436116189241710294771448096302698329011e-01, 5.359569674352150328276276729768332288862665184192705821636342e-03, -9.643212009650708202650320534322484127430880143045220514346402e-02, 1.084913025582218438089010237748152188661630567603334659322512e-02, 4.154627749508444073927094681906574864513532221388374861287078e-02, -1.221864906974828071998798266471567712982466093116558175344811e-02, -1.284082519830068329466034471894728496206109832314097633275225e-02, 6.711499008795509177767027068215672450648112185856456740379455e-03, 2.248607240995237599950865211267234018343199786146177099262010e-03, -2.179503618627760471598903379584171187840075291860571264980942e-03, 6.545128212509595566500430399327110729111770568897356630714552e-06, 3.886530628209314435897288837795981791917488573420177523436096e-04, -8.850410920820432420821645961553726598738322151471932808015443e-05, -2.424154575703078402978915320531719580423778362664282239377532e-05, 1.277695221937976658714046362616620887375960941439428756055353e-05, -1.529071758068510902712239164522901223197615439660340672602696e-06})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies13</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a49147165dff3f7a6d01785be58b8face</anchor>
      <arglist>({9.202133538962367972970163475644184667534171916416562386009703e-03, 8.286124387290277964432027131230466405208113332890135072514277e-02, 3.119963221604380633960784112214049693946683528967180317160390e-01, 6.110558511587876528211995136744180562073612676018239438526582e-01, 5.888895704312189080710395347395333927665986382812836042235573e-01, 8.698572617964723731023739838087494399231884076619701250882016e-02, -3.149729077113886329981698255932282582876888450678789025950306e-01, -1.245767307508152589413808336021260180792739295173634719572069e-01, 1.794760794293398432348450072339369013581966256244133393042881e-01, 7.294893365677716380902830610477661983325929026879873553627963e-02, -1.058076181879343264509667304196464849478860754801236658232360e-01, -2.648840647534369463963912248034785726419604844297697016264224e-02, 5.613947710028342886214501998387331119988378792543100244737056e-02, 2.379972254059078811465170958554208358094394612051934868475139e-03, -2.383142071032364903206403067757739134252922717636226274077298e-02, 3.923941448797416243316370220815526558824746623451404043918407e-03, 7.255589401617566194518393300502698898973529679646683695269828e-03, -2.761911234656862178014576266098445995350093330501818024966316e-03, -1.315673911892298936613835370593643376060412592653652307238124e-03, 9.323261308672633862226517802548514100918088299801952307991569e-04, 4.925152512628946192140957387866596210103778299388823500840094e-05, -1.651289885565054894616687709238000755898548214659776703347801e-04, 3.067853757932549346649483228575476236600428217237900563128230e-05, 1.044193057140813708170714991080596951670706436217328169641474e-05, -4.700416479360868325650195165061771321650383582970958556568059e-06, 5.220035098454864691736424354843176976747052155243557001531901e-07})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies14</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a813fedb44ae17519e3e21754f213e43a</anchor>
      <arglist>({6.461153460087947818166397448622814272327159419201199218101404e-03, 6.236475884939889832798566758434877428305333693407667164602518e-02, 2.548502677926213536659077886778286686187042416367137443780084e-01, 5.543056179408938359926831449851154844078269830951634609683997e-01, 6.311878491048567795576617135358172348623952456570017289788809e-01, 2.186706877589065214917475918217517051765774321270432059030273e-01, -2.716885522787480414142192476181171094604882465683330814311896e-01, -2.180335299932760447555558812702311911975240669470604752747127e-01, 1.383952138648065910739939690021573713989900463229686119059119e-01, 1.399890165844607012492943162271163440328221555614326181333683e-01, -8.674841156816968904560822066727795382979149539517503657492964e-02, -7.154895550404613073584145115173807990958069673129538099990913e-02, 5.523712625921604411618834060533403397913833632511672157671107e-02, 2.698140830791291697399031403215193343375766595807274233284349e-02, -3.018535154039063518714822623489137573781575406658652624883756e-02, -5.615049530356959133218371367691498637457297203925810387698680e-03, 1.278949326633340896157330705784079299374903861572058313481534e-02, -7.462189892683849371817160739181780971958187988813302900435487e-04, -3.849638868022187445786349316095551774096818508285700493058915e-03, 1.061691085606761843032566749388411173033941582147830863893939e-03, 7.080211542355278586442977697617128983471863464181595371670094e-04, -3.868319473129544821076663398057314427328902107842165379901468e-04, -4.177724577037259735267979539839258928389726590132730131054323e-05, 6.875504252697509603873437021628031601890370687651875279882727e-05, -1.033720918457077394661407342594814586269272509490744850691443e-05, -4.389704901781394115254042561367169829323085360800825718151049e-06, 1.724994675367812769885712692741798523587894709867356576910717e-06, -1.787139968311359076334192938470839343882990309976959446994022e-07})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies15</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a6681b4c96d6054bff40539df33b72b86</anchor>
      <arglist>({4.538537361578898881459394910211696346663671243788786997916513e-03, 4.674339489276627189170969334843575776579151700214943513113197e-02, 2.060238639869957315398915009476307219306138505641930902702047e-01, 4.926317717081396236067757074029946372617221565130932402160160e-01, 6.458131403574243581764209120106917996432608287494046181071489e-01, 3.390025354547315276912641143835773918756769491793554669336690e-01, -1.932041396091454287063990534321471746304090039142863827937754e-01, -2.888825965669656462484125009822332981311435630435342594971292e-01, 6.528295284877281692283107919869574882039174285596144125965101e-02, 1.901467140071229823484893116586020517959501258174336696878156e-01, -3.966617655579094448384366751896200668381742820683736805449745e-02, -1.111209360372316933656710324674058608858623762165914120505657e-01, 3.387714392350768620854817844433523770864744687411265369463195e-02, 5.478055058450761268913790312581879108609415997422768564244845e-02, -2.576700732843996258594525754269826392203641634825340138396836e-02, -2.081005016969308167788483424677000162054657951364899040996166e-02, 1.508391802783590236329274460170322736244892823305627716233968e-02, 5.101000360407543169708860185565314724801066527344222055526631e-03, -6.487734560315744995181683149218690816955845639388826407928967e-03, -2.417564907616242811667225326300179605229946995814535223329411e-04, 1.943323980382211541764912332541087441011424865579531401452302e-03, -3.734823541376169920098094213645414611387630968030256625740226e-04, -3.595652443624688121649620075909808858194202454084090305627480e-04, 1.558964899205997479471658241227108816255567059625495915228603e-04, 2.579269915531893680925862417616855912944042368767340709160119e-05, -2.813329626604781364755324777078478665791443876293788904267255e-05, 3.362987181737579803124845210420177472134846655864078187186304e-06, 1.811270407940577083768510912285841160577085925337507850590290e-06, -6.316882325881664421201597299517657654166137915121195510416641e-07, 6.133359913305752029056299460289788601989190450885396512173845e-08})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies16</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a66cb1ad7be03f54ede0122d376d55356</anchor>
      <arglist>({3.189220925347738029769547564645958687067086750131428767875878e-03, 3.490771432367334641030147224023020009218241430503984146140054e-02, 1.650642834888531178991252730561134811584835002342723240213592e-01, 4.303127228460038137403925424357684620633970478036986773924646e-01, 6.373563320837888986319852412996030536498595940814198125967751e-01, 4.402902568863569000390869163571679288527803035135272578789884e-01, -8.975108940248964285718718077442597430659247445582660149624718e-02, -3.270633105279177046462905675689119641757228918228812428141723e-01, -2.791820813302827668264519595026873204339971219174736041535479e-02, 2.111906939471042887209680163268837900928491426167679439251042e-01, 2.734026375271604136485245757201617965429027819507130220231500e-02, -1.323883055638103904500474147756493375092287817706027978798549e-01, -6.239722752474871765674503394120025865444656311678760990761458e-03, 7.592423604427631582148498743941422461530405946100943351940313e-02, -7.588974368857737638494890864636995796586975144990925400097160e-03, -3.688839769173014233352666320894554314718748429706730831064068e-02, 1.029765964095596941165000580076616900528856265803662208854147e-02, 1.399376885982873102950451873670329726409840291727868988490100e-02, -6.990014563413916670284249536517288338057856199646469078115759e-03, -3.644279621498389932169000540933629387055333973353108668841215e-03, 3.128023381206268831661202559854678767821471906193608117450360e-03, 4.078969808497128362417470323406095782431952972310546715071397e-04, -9.410217493595675889266453953635875407754747216734480509250273e-04, 1.142415200387223926440228099555662945839684344936472652877091e-04, 1.747872452253381803801758637660746874986024728615399897971953e-04, -6.103596621410935835162369150522212811957259981965919143961722e-05, -1.394566898820889345199078311998401982325273569198675335408707e-05, 1.133660866127625858758848762886536997519471068203753661757843e-05, -1.043571342311606501525454737262615404887478930635676471546032e-06, -7.363656785451205512099695719725563646585445545841663327433569e-07, 2.308784086857545866405412732942006121306306735866655525372544e-07, -2.109339630100743097000572623603489906836297584591605307745349e-08})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies17</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a36fbf51bae105b8f6d10c88c5a9cbe6d</anchor>
      <arglist>({2.241807001037312853535962677074436914062191880560370733250531e-03, 2.598539370360604338914864591720788315473944524878241294399948e-02, 1.312149033078244065775506231859069960144293609259978530067004e-01, 3.703507241526411504492548190721886449477078876896803823650425e-01, 6.109966156846228181886678867679372082737093893358726291371783e-01, 5.183157640569378393254538528085968046216817197718416402439904e-01, 2.731497040329363500431250719147586480350469818964563003672942e-02, -3.283207483639617360909665340725061767581597698151558024679130e-01, -1.265997522158827028744679110933825505053966260104086162103728e-01, 1.973105895650109927854047044781930142551422414135646917122284e-01, 1.011354891774702721509699856433434802196622545499664876109437e-01, -1.268156917782863110948571128662331680384792185915017065732137e-01, -5.709141963167692728911239478651382324161160869845347053990144e-02, 8.110598665416088507965885748555429201024364190954499194020678e-02, 2.231233617810379595339136059534813756232242114093689244020869e-02, -4.692243838926973733300897059211400507138768125498030602878439e-02, -3.270955535819293781655360222177494452069525958061609392809275e-03, 2.273367658394627031845616244788448969906713741338339498024864e-02, -3.042989981354637068592482637907206078633395457225096588287881e-03, -8.602921520322854831713706413243659917926736284271730611920986e-03, 2.967996691526094872806485060008038269959463846548378995044195e-03, 2.301205242153545624302059869038423604241976680189447476064764e-03, -1.436845304802976126222890402980384903503674530729935809561434e-03, -3.281325194098379713954444017520115075812402442728749700195651e-04, 4.394654277686436778385677527317841632289249319738892179465910e-04, -2.561010956654845882729891210949920221664082061531909655178413e-05, -8.204803202453391839095482576282189866136273049636764338689593e-05, 2.318681379874595084482068205706277572106695174091895338530734e-05, 6.990600985076751273204549700855378627762758585902057964027481e-06, -4.505942477222988194102268206378312129713572600716499944918416e-06, 3.016549609994557415605207594879939763476168705217646897702706e-07, 2.957700933316856754979905258816151367870345628924317307354639e-07, -8.423948446002680178787071296922877068410310942222799622593133e-08, 7.267492968561608110879767441409035034158581719789791088892046e-09})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies18</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa39515c6c808b7ec7170e69148364209</anchor>
      <arglist>({1.576310218440760431540744929939777747670753710991660363684429e-03, 1.928853172414637705921391715829052419954667025288497572236714e-02, 1.035884658224235962241910491937253596470696555220241672976224e-01, 3.146789413370316990571998255652579931786706190489374509491307e-01, 5.718268077666072234818589370900623419393673743130930561295324e-01, 5.718016548886513352891119994065965025668047882818525060759395e-01, 1.472231119699281415750977271081072312557864107355701387801677e-01, -2.936540407365587442479030994981150723935710729035053239661752e-01, -2.164809340051429711237678625668271471437937235669492408388692e-01, 1.495339755653777893509301738913667208804816691893765610261943e-01, 1.670813127632574045149318139950134745324205646353988083152250e-01, -9.233188415084628060429372558659459731431848000144569612074508e-02, -1.067522466598284855932200581614984861385266404624112083917702e-01, 6.488721621190544281947577955141911463129382116634147846137149e-02, 5.705124773853688412090768846499622260596226120431038524600676e-02, -4.452614190298232471556143559744653492971477891439833592755034e-02, -2.373321039586000103275209582665216110197519330713490233071565e-02, 2.667070592647059029987908631672020343207895999936072813363471e-02, 6.262167954305707485236093144497882501990325204745013190268052e-03, -1.305148094661200177277636447600807169755191054507571666606133e-02, 1.186300338581174657301741592161819084544899417452317405185615e-04, 4.943343605466738130665529516802974834299638313366477765295203e-03, -1.118732666992497072800658855238650182318060482584970145512687e-03, -1.340596298336106629517567228251583609823044524685986640323942e-03, 6.284656829651457125619449885420838217551022796301582874349652e-04, 2.135815619103406884039052814341926025873200325996466522543440e-04, -1.986485523117479485798245416362489554927797880264017876139605e-04, -1.535917123534724675069770335876717193700472427021513236587288e-07, 3.741237880740038181092208138035393952304292615793985030731363e-05, -8.520602537446695203919254911655523022437596956226376512305917e-06, -3.332634478885821888782452033341036827311505907796498439829337e-06, 1.768712983627615455876328730755375176412501359114058815453100e-06, -7.691632689885176146000152878539598405817397588156525116769908e-08, -1.176098767028231698450982356561292561347579777695396953528141e-07, 3.068835863045174800935478294933975372450179787894574492930570e-08, -2.507934454948598267195173183147126731806317144868275819941403e-09})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies19</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a5632b88883c0693d1a196806cae948d6</anchor>
      <arglist>({1.108669763181710571099154195209715164245299677773435932135455e-03, 1.428109845076439737439889152950199234745663442163665957870715e-02, 8.127811326545955065296306784901624839844979971028620366497726e-02, 2.643884317408967846748100380289426873862377807211920718417385e-01, 5.244363774646549153360575975484064626044633641048072116393160e-01, 6.017045491275378948867077135921802620536565639585963293313931e-01, 2.608949526510388292872456675310528324172673101301907739925213e-01, -2.280913942154826463746325776054637207093787237086425909534822e-01, -2.858386317558262418545975695028984237217356095588335149922119e-01, 7.465226970810326636763433111878819005865866149731909656365399e-02, 2.123497433062784888090608567059824197077074200878839448416908e-01, -3.351854190230287868169388418785731506977845075238966819814032e-02, -1.427856950387365749779602731626112812998497706152428508627562e-01, 2.758435062562866875014743520162198655374474596963423080762818e-02, 8.690675555581223248847645428808443034785208002468192759640352e-02, -2.650123625012304089901835843676387361075068017686747808171345e-02, -4.567422627723090805645444214295796017938935732115630050880109e-02, 2.162376740958504713032984257172372354318097067858752542571020e-02, 1.937554988917612764637094354457999814496885095875825546406963e-02, -1.398838867853514163250401235248662521916813867453095836808366e-02, -5.866922281012174726584493436054373773814608340808758177372765e-03, 7.040747367105243153014511207400620109401689897665383078229398e-03, 7.689543592575483559749139148673955163477947086039406129546422e-04, -2.687551800701582003957363855070398636534038920982478290170267e-03, 3.418086534585957765651657290463808135214214848819517257794031e-04, 7.358025205054352070260481905397281875183175792779904858189494e-04, -2.606761356786280057318315130897522790383939362073563408613547e-04, -1.246007917341587753449784408901653990317341413341980904757592e-04, 8.711270467219922965416862388191128268412933893282083517729443e-05, 5.105950487073886053049222809934231573687367992106282669389264e-06, -1.664017629715494454620677719899198630333675608812018108739144e-05, 3.010964316296526339695334454725943632645798938162427168851382e-06, 1.531931476691193063931832381086636031203123032723477463624141e-06, -6.862755657769142701883554613486732854452740752771392411758418e-07, 1.447088298797844542078219863291615420551673574071367834316167e-08, 4.636937775782604223430857728210948898871748291085962296649320e-08, -1.116402067035825816390504769142472586464975799284473682246076e-08, 8.666848838997619350323013540782124627289742190273059319122840e-10})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies20</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ad27ad97784ced5e128aa54f5b8dbf6d8</anchor>
      <arglist>({7.799536136668463215861994818889370970510722039232863880031127e-04, 1.054939462495039832454480973015641498231961468733236691299796e-02, 6.342378045908151497587346582668785136406523315729666353643372e-02, 2.199421135513970450080335972537209392121306761010882209298252e-01, 4.726961853109016963710241465101446230757804141171727845834637e-01, 6.104932389385938201631515660084201906858628924695448898824748e-01, 3.615022987393310629195602665268631744967084723079677894136358e-01, -1.392120880114838725806970545155530518264944915437808314813582e-01, -3.267868004340349674031122837905370666716645587480021744425550e-01, -1.672708830907700757517174997304297054003744303620479394006890e-02, 2.282910508199163229728429126648223086437547237250290835639880e-01, 3.985024645777120219790581076522174181104027576954427684456660e-02, -1.554587507072679559315307870562464374359996091752285157077477e-01, -2.471682733861358401587992299169922262915151413349313513685587e-02, 1.022917191744425578861013681016866083888381385233081516583444e-01, 5.632246857307435506953246988215209861566800664402785938591145e-03, -6.172289962468045973318658334083283558209278762007041823250642e-02, 5.874681811811826491300679742081997167209743446956901841959711e-03, 3.229429953076958175885440860617219117564558605035979601073235e-02, -8.789324923901561348753650366700695916503030939283830968151332e-03, -1.381052613715192007819606423860356590496904285724730356602106e-02, 6.721627302259456835336850521405425560520025237915708362002910e-03, 4.420542387045790963058229526673514088808999478115581153468068e-03, -3.581494259609622777556169638358238375765194248623891034940330e-03, -8.315621728225569192482585199373230956924484221135739973390038e-04, 1.392559619323136323905254999347967283760544147397530531142397e-03, -5.349759843997695051759716377213680036185796059087353172073952e-05, -3.851047486992176060650288501475716463266233035937022303649838e-04, 1.015328897367029050797488785306056522529979267572003990901472e-04, 6.774280828377729558011184406727978221295796652200819839464354e-05, -3.710586183394712864227221271216408416958225264980612822617745e-05, -4.376143862183996810373095822528607606900620592585762190542483e-06, 7.241248287673620102843105877497181565468725757387007139555885e-06, -1.011994010018886150340475413756849103197395069431085005709201e-06, -6.847079597000556894163334787575159759109091330092963990364192e-07, 2.633924226270001084129057791994367121555769686616747162262697e-07, 2.014322023550512694324757845944026047904414136633776958392681e-10, -1.814843248299695973210605258227024081458531110762083371310917e-08, 4.056127055551832766099146230616888024627380574113178257963252e-09, -2.998836489619319566407767078372705385732460052685621923178375e-10})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies21</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa16c67f6867519547aaeef71fefc83ec</anchor>
      <arglist>({5.488225098526837086776336675992521426750673054588245523834775e-04, 7.776639052354783754338787398088799862510779059555623704879234e-03, 4.924777153817727491399853378340056968104483161598320693657954e-02, 1.813596254403815156260378722764624190931951510708050516519181e-01, 4.196879449393627730946850609089266339973601543036294871772653e-01, 6.015060949350038975629880664020955953066542593896126705346122e-01, 4.445904519276003403643290994523601016151342743089878478478962e-01, -3.572291961725529045922914178005307189036762547143966578066838e-02, -3.356640895305295094832978867114363069987575282256098351499731e-01, -1.123970715684509813515004981340306901641824212464197973490295e-01, 2.115645276808723923846781645238468659430862736248896128529373e-01, 1.152332984396871041993434411681730428103160016594558944687967e-01, -1.399404249325472249247758764839776903226503657502071670245304e-01, -8.177594298086382887387303634193790542522570670234556157566786e-02, 9.660039032372422070232189700372539681627783322249829842275517e-02, 4.572340574922879239251202944731235421034828710753381191345186e-02, -6.497750489373232063332311106008616685748929419452249544690967e-02, -1.865385920211851534093244412008141266131208093007217139232170e-02, 3.972683542785044175197464400756126818299918992482587866999707e-02, 3.357756390338110842532604766376200760791669954106679933144723e-03, -2.089205367797907948785235479746212371728219866525211135343707e-02, 2.403470920805434762380632169785689545910525667396313550679652e-03, 8.988824381971911875349463398395464114417817949738911101372312e-03, -2.891334348588901247375268718015882610844675931117463495551958e-03, -2.958374038932831280750770228215510959830170264176955719827510e-03, 1.716607040630624138494506282569230126333308533535502799235333e-03, 6.394185005120302146432543767052865436099994387647359452249347e-04, -6.906711170821016507268939228893784790518270744313525548714065e-04, -3.196406277680437193708834220804640347636984901270948088339102e-05, 1.936646504165080615323696689856004910579777568504218782029027e-04, -3.635520250086338309442855006186370752206331429871136596927137e-05, -3.499665984987447953974079490046597240276268044409625722689849e-05, 1.535482509276049283124233498646050472096482329299719141107128e-05, 2.790330539814487046106169582691767916283793946025922387556917e-06, -3.090017164545699197158555936852697325985864588418167982685400e-06, 3.166095442367030556603889009833954440058545355777781782000278e-07, 2.992136630464852794401294607536813682771292352506328096125857e-07, -1.000400879030597332045460600516621971679363965166249211063755e-07, -2.254014974673330131563184851456825991617915549643308754828159e-09, 7.058033541231121859020947976903904685464512825731230495144226e-09, -1.471954197650365265189549600816698778213247061389470277337173e-09, 1.038805571023706553035373138760372703492942617518816122570050e-10})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies22</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a6ed5cb3696cd40be0cbf6d6731bcaf4f</anchor>
      <arglist>({3.862632314910982158524358900615460368877852009576899680767316e-04, 5.721854631334539120809783403484493333555361591386208129183833e-03, 3.806993723641108494769873046391825574447727068953448390456335e-02, 1.483675408901114285014404448710249837385836373168215616427030e-01, 3.677286834460374788614690818452372827430535649696462720334897e-01, 5.784327310095244271421181831735444106385099957908657145590104e-01, 5.079010906221639018391523325390716836568713192498711562711282e-01, 7.372450118363015165570139016530653113725172412104955350368114e-02, -3.127265804282961918033226222621788537078452535993545440716988e-01, -2.005684061048870939324361244042200174132905844868237447130382e-01, 1.640931881067664818606223226286885712554385317412228836705888e-01, 1.799731879928913037252154295313083168387840791424988422757762e-01, -9.711079840911470969274209179691733251456735137994201552926799e-02, -1.317681376866834107513648518146838345477875022352088357523838e-01, 6.807631439273221556739202147004580559367442550641388181886023e-02, 8.455737636682607503362813659356786494357635805197410905877078e-02, -5.136425429744413245727949984018884707909441768477091944584584e-02, -4.653081182750671347875833607846979997825771277976548080904423e-02, 3.697084662069802057615318892988581825637896696876361343354380e-02, 2.058670762756536044060249710676656807281671451609632981487139e-02, -2.348000134449318868560142854519364987363882333754753819791381e-02, -6.213782849364658499069336123807608293122900450508440420104462e-03, 1.256472521834337406887017835495604463815382993214296088172221e-02, 3.001373985076435951229129255588255746904937042979316054485183e-04, -5.455691986156717076595353163071679107868762395367234726592273e-03, 1.044260739186025323350755659184734060807432172611689413745029e-03, 1.827010495657279080112597436850157110235336772062961041154607e-03, -7.706909881231196232880372722955519781655769913634565757339739e-04, -4.237873998391800799531947768003976978197438302533528661825758e-04, 3.286094142136787341983758471405935405823323072829619248523697e-04, 4.345899904532003379046992625575076092823809665933575578710696e-05, -9.405223634815760421845190098352673647881298980040512091599943e-05, 1.137434966212593172736144274866639210339820203135670505287250e-05, 1.737375695756189356163565074505405906859746605867772002320509e-05, -6.166729316467578372152251668422979152169587307212708981768966e-06, -1.565179131995160159307426993578204733378112742579926503832095e-06, 1.295182057318877573889711232345068147800395721925682566394936e-06, -8.779879873361286276888117046153049053917243760475816789226764e-08, -1.283336228751754417819693932114064887075096030264748079976736e-07, 3.761228749337362366156711648187743399164239397803629022612862e-08, 1.680171404922988885554331183691280245962290247654438114807112e-09, -2.729623146632976083449327361739104754443221903317745768938846e-09, 5.335938821667489905169783227036804533253011117886586305435615e-10, -3.602113484339554703794807810939301847299106970237814334104274e-11})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies23</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ab8fe7671f0819ad697a089109032ff96</anchor>
      <arglist>({2.719041941282888414192673609703302357098336003920923958924757e-04, 4.202748893183833538390034372523511472345215563611003407984701e-03, 2.931000365788411514736204018929480427874317460676079959515131e-02, 1.205155317839719336306053895611899089004274336891709067958035e-01, 3.184508138528652363416527748460472152790575031409830417259640e-01, 5.449311478735204282674240672421984387504149924834544495466793e-01, 5.510185172419193913452724227212507720514144116478727269717859e-01, 1.813926253638400136259098302138614937264260737638175539416540e-01, -2.613921480306441118856795735210118413900307577511142987337375e-01, -2.714020986078430556604069575184718123763697177381058877113471e-01, 9.212540708241805260646030910734894258577648089100630012130261e-02, 2.235736582420402317149513960822561717689875252792817094811874e-01, -3.303744709428937875006612792463031409461636228731285046551636e-02, -1.640113215318759250156057837165276039181451149292112929401186e-01, 2.028307457564929974897286607551313323418860610791382310375731e-02, 1.122970436181072886950734465075645977754665593869789965874572e-01, -2.112621235622724100704783293549467048999443844657058425212982e-02, -7.020739157490110946204219011957565343899895499962369353294028e-02, 2.176585683449997560776882472168730165799461445156766923497545e-02, 3.849533252256919901057154320407596073180564628069920893870768e-02, -1.852351365015615979794689960740674782817814176166333519597796e-02, -1.753710100303584537915846117408613551147985251726558719415169e-02, 1.275194393152828646243157404474947115052750581861997731041018e-02, 6.031840650024162816289878206037841640814102314209075233751820e-03, -7.075319273706152814194039481466556204493276773483821748740018e-03, -1.134865473356251691289337120013286756337393784110786907825400e-03, 3.122876449818144997419144765125750522437659393621577492535411e-03, -2.465014005163512031940473100375377210862560761576109755841161e-04, -1.061231228886651321139357625683805642193648671030425010215075e-03, 3.194204927099011503676530359692366990929679170022583007683112e-04, 2.567624520078737205563856675376636092314813400664190770435450e-04, -1.500218503490340967673163290447832236259277810659068637402668e-04, -3.378894834120903434270962452674534330903724108906662510305045e-05, 4.426071203109246077621875303440935335701832843654692827539837e-05, -2.635207889249186237209225933170897825432335273771458456888097e-06, -8.347875567854625544366043748844183086765894974439245409223337e-06, 2.397569546840240057403739507525641239509517148980849889986407e-06, 8.147574834779447778085443041422881439860288287528356019216814e-07, -5.339005405209421154584783682848780965053642859373536945701365e-07, 1.853091785633965019353699857864654181728710556702529908304185e-08, 5.417549179539278736503176166323685597634496102979977037271945e-08, -1.399935495437998845130909687361847103274208993447892120341999e-08, -9.472885901812050535221582074673490573092096712822067564903012e-10, 1.050446453696543404071105111096438573423068913105255997908040e-09, -1.932405111313417542192651899622541612314066389643607507706887e-10, 1.250203302351040941433216718217504240541423430995137507404787e-11})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies24</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aac29c3b28887ea10c40db90a28c4517a</anchor>
      <arglist>({1.914358009475513695026138336474115599435172088053846745168462e-04, 3.082081714905494436206199424544404720984720556128685270556458e-03, 2.248233994971641072358415157184825628226776692231940577581580e-02, 9.726223583362519663806545734008355914527504417674578571164300e-02, 2.729089160677263268706137134412557268751671263458895098625356e-01, 5.043710408399249919771876890402814109246866444441814540282099e-01, 5.749392210955419968460807901923407033144945935105622912839838e-01, 2.809855532337118833442626085115402941842959475929278883281409e-01, -1.872714068851562376981887159775791469060265778441667840307934e-01, -3.179430789993627375453948489797707550898087789160025182664299e-01, 4.776613684344728187950198323031360866349104994035553200788631e-03, 2.392373887803108551973268291945824822214858134512317715815616e-01, 4.252872964148383258147364472170645232684343235486951540533893e-02, -1.711753513703468896897638515080572393949165942335556397917666e-01, -3.877717357792001620177594726199572688446488033750771020190283e-02, 1.210163034692242362312637311149062286659377039046006801523826e-01, 2.098011370914481534980883827326017063121637262728447783605518e-02, -8.216165420800166702291466006164189460916816748629968198028898e-02, -4.578436241819221637997516339765068825260159169893967894877272e-03, 5.130162003998087915555334881398688958843078494595140394873884e-02, -4.944709428125628299815920032649550811877887219282751174798211e-03, -2.821310709490189098113895361900699228886900995412759197674058e-02, 7.661721881646585897329899904308764405384658404613669817843430e-03, 1.304997087108573583052494067883717533043101857128653233783396e-02, -6.291435370018187780721843581169343900864298634085743861509767e-03, -4.746568786323113800477796959513558401732252800905982385017245e-03, 3.736046178282523345179052160810332868725126356493155728625572e-03, 1.153764936839481504858282495202271984454410046682805375157566e-03, -1.696456818974824394274534636412116243080312601322325642741589e-03, -4.416184856141520063365958900079406737636243682138363561877750e-05, 5.861270593183109933716735450272894035425792347806515678695765e-04, -1.181233237969554740613021227756568966806892308457221016257961e-04, -1.460079817762616838924301818082729036314539476811023255670666e-04, 6.559388639305634085303738560455061974369354538271316071502698e-05, 2.183241460466558363365044032984257709791187640963509380549307e-05, -2.022888292612697682860859987200455702614855595412267510558659e-05, 1.341157750809114719319937553186023660581084151828593222893663e-08, 3.901100338597702610409014129024223853127911530009766793352492e-06, -8.980253143938407724149926669980791166378388013293887718404796e-07, -4.032507756879971624098983247358983425236092110387724315244646e-07, 2.166339653278574639176393978510246335478946697396400359281412e-07, -5.057645419792500308492508924343248979317507866520688417567606e-10, -2.255740388176086107368821674947175804005323153443170526520277e-08, 5.157776789671999638950774266313208715015419699643333784626363e-09, 4.748375824256231118094453549799175824526559994333227456737433e-10, -4.024658644584379774251499574468195118601698713554294941756559e-10, 6.991801157638230974132696433509625934021677793453732225542951e-11, -4.342782503803710247259037552886749457951053124203814185811297e-12})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies25</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a765bf43c5fcb3d2245f1b5c530dcbc8d</anchor>
      <arglist>({1.348029793470188994578489247159356055370460656508881471268611e-04, 2.256959591854779520121391049628056149270016860666661928130747e-03, 1.718674125404015533817186914954848902241194002444696221013131e-02, 7.803586287213267559750659320481403668422052199257139168386084e-02, 2.316935078860218199900621518057089104946216881512075361624214e-01, 4.596834151460945937896973864539659944010260858049947396093277e-01, 5.816368967460577833534892038757085635755639698734580573323031e-01, 3.678850748029466984371319740855532278670733841012809062966976e-01, -9.717464096463814276130048169040892607068486428294030952842447e-02, -3.364730796417461309562110148848845218930261030262170601615289e-01, -8.758761458765466140226687673880006154266689569025041229545538e-02, 2.245378197451017129525176510409543155930843160711989062118482e-01, 1.181552867199598604563067876819931882639429216001523151773895e-01, -1.505602137505796309518094206831433270850173484773520730186277e-01, -9.850861528996022153725952822686729410420350758543226219234795e-02, 1.066338050184779528831274540522414711301747903916268438037723e-01, 6.675216449401860666895983072443984697329752470942906490126865e-02, -7.708411105657419356208567671699032054872853174701595359329826e-02, -3.717396286112250887598137324046870459877639250821705817221557e-02, 5.361790939877949960629041419546536897037332284703545849594129e-02, 1.554260592910229163981295854603203625062268043511894295387375e-02, -3.404232046065334099320628584033729153497903561399447916116575e-02, -3.079836794847036661636693963570288706232460663070983852354326e-03, 1.892280447662762841086581178691039363674755753459524525886478e-02, -1.989425782202736494289461896386235348901617760816745484282494e-03, -8.860702618046368399013064252456556969199612331833605310278698e-03, 2.726936258738495739871469244610042793734119359765762028996059e-03, 3.322707773973191780118197357194829286271392998979276105842863e-03, -1.842484290203331280837780430014195744813667655929909114672154e-03, -8.999774237462950491085382524008429604309720852269895692000702e-04, 8.772581936748274843488806190175921376284150686011179612908221e-04, 1.153212440466300456460181455345639872216326644527860903202733e-04, -3.098800990984697989530544245356271119416614147098459162436317e-04, 3.543714523276059005284289830559259809540337561365927850248007e-05, 7.904640003965528255137496303166001735463107762646364003487560e-05, -2.733048119960041746353244004225286857636045649642652816856524e-05, -1.277195293199783804144903848434605690990373526086311486716394e-05, 8.990661393062588905369930197413951232059323587543226269327396e-06, 5.232827708153076417963912065899772684403904504491727061662335e-07, -1.779201332653634562565948556039009149458987774189389221295909e-06, 3.212037518862519094895005816661093988294166712919881121802831e-07, 1.922806790142371601278104244711267420759978799176017569693322e-07, -8.656941732278507163388031517930974947984281611717187862530250e-08, -2.611598556111770864259843089151782206922842627174274274741722e-09, 9.279224480081372372250073354726511359667401736947170444723772e-09, -1.880415755062155537197782595740975189878162661203102565611681e-09, -2.228474910228168899314793352064795957306403503495743572518755e-10, 1.535901570162657197021927739530721955859277615795931442682785e-10, -2.527625163465644811048864286169758128142169484216932624854015e-11, 1.509692082823910867903367712096001664979004526477422347957324e-12})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies26</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>adf4f6bf1d5460099e7c81552f77aa23a</anchor>
      <arglist>({9.493795750710592117802731381148054398461637804818126397577999e-05, 1.650520233532988247022384885622071050555268137055829216839523e-03, 1.309755429255850082057770240106799154079932963479202407364818e-02, 6.227474402514960484193581705107415937690538641013309745983962e-02, 1.950394387167700994245891508369324694703820522489789125908612e-01, 4.132929622783563686116108686666547082846741228042232731476147e-01, 5.736690430342222603195557147853022060758392664086633396520345e-01, 4.391583117891662321931477565794105633815363384084590559889493e-01, 1.774076780986685727823533562031556893226571319881417676492595e-03, -3.263845936917800216385340830055349953447745005769416287177497e-01, -1.748399612893925042664835683606584215248582345438816346170042e-01, 1.812918323111226960705459766025430918716233584167982942044424e-01, 1.827554095896723746537533832033286839689931924709760567945595e-01, -1.043239002859270439148009137202747658420968144330108510179290e-01, -1.479771932752544935782314546369458188243947772922980064071205e-01, 6.982318611329236513756591683950208955110603212379412334701145e-02, 1.064824052498086303236593797715344405836015002929319291715777e-01, -5.344856168148319149493577269390074213960237013099439431132086e-02, -6.865475960403591525454725258715351280947435823354011140858001e-02, 4.223218579637203541206570902753288247790857760067894456114927e-02, 3.853571597111186425832144567362328142994885395255438867968781e-02, -3.137811036306775484244644776337594435094096964336402798072360e-02, -1.776090356835818354094298625884058170354129044259951019182732e-02, 2.073492017996382475887790073068984224515077665517103399898854e-02, 5.829580555318887971939315747596613038479561943085291072787359e-03, -1.178549790619302893728624468402138072504226527540325463847390e-02, -5.287383992626814439198630765217969804966319971038003993984480e-04, 5.601947239423804853206514239940474788977188460452053462770324e-03, -9.390582504738289646165698675070641765810790863514339205205998e-04, -2.145530281567620980305401403432221668847980295600748913748902e-03, 8.383488056543616046381924054554052104937784379435436426690560e-04, 6.161382204574344193703789012696411561214682388271673214197731e-04, -4.319557074261807466712901913481943478521991611607433971794602e-04, -1.060574748283803889966150803551837402553866816191659959347053e-04, 1.574795238607493590547765666590811258087715699737771458390360e-04, -5.277795493037868976293566636015627609248847457646525246271036e-06, -4.109673996391477816326502438997466532822639385119090230965252e-05, 1.074221540872195031273584409245060623104931330938273936484593e-05, 7.000078682964986734859102495210684809643657474253921074934684e-06, -3.887400161856795187587790410706550576033603097954065074023128e-06, -4.650463220640262639231145944536092973446596027469833860001618e-07, 7.939210633709952088373459255067360793370284788682979065122810e-07, -1.079004237578671411922961583845716126060658213943840375162654e-07, -8.904466370168590769052983362721567202750591914741016835071257e-08, 3.407795621290730008673832107214820587991557116806912418558069e-08, 2.169328259850323106986222296525930099935873861026310788086221e-09, -3.776010478532324328184043667556576385639846460337894963138621e-09, 6.780047245828636668305808192607091517605349478677442468580825e-10, 1.002303191046526913509281844136258004034177309673269533418644e-10, -5.840408185341171468465492447799819262905317576847426970757700e-11, 9.130510016371796243923232926650252570239054815939483900056681e-12, -5.251871224244435037810503452564279828539007071678724285717464e-13})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies27</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acbddeb1aa90e3b2f2838faf84967c139</anchor>
      <arglist>({6.687131385431931734918880680779563307675740731544063787599480e-05, 1.205531231673213234251999812212394463872002561229330125152073e-03, 9.952588780876619771874091297340545740163119816300838847749336e-03, 4.945259998290488004302995584228917712171023349013386944893643e-02, 1.629220275023933206396286389387812803673796872000118325233533e-01, 3.671102141253898226423388094379126394383458407087000700420400e-01, 5.538498609904800487605460395549044755068663194750017660900436e-01, 4.934061226779989979265447084358038959373468583404767251300717e-01, 1.028408550618229112710739475157388764479351682549490307668477e-01, -2.897168033145948463175311101489473923261698802610323264603418e-01, -2.482645819032605667810198368127693701263349361209208170092197e-01, 1.148230195177853576326445213787661879970642975306605349249036e-01, 2.272732884141708265275037216925482827043581894357907763081103e-01, -3.878641863180231062443346843661817078060143110529946543683356e-02, -1.780317409590085821070366277249759321269342801053489323888575e-01, 1.579939746024048431173907799261019471878724997312653292884660e-02, 1.311979717171553289711406975836688896451835867594492827800969e-01, -1.406275155580876537026622167053147161846397735962817855782362e-02, -9.102290652956591798241345515773322449830692586525337562864481e-02, 1.731101826549371089085675445961947677452358872325373949295769e-02, 5.796940573471798814748840657698008349462526768238833307489106e-02, -1.851249356199807710545837861298826718763077900221574749342712e-02, -3.273906663102087145481936428049519742538150452785563039743756e-02, 1.614696692239566682272152627542980896527822528487665111124260e-02, 1.566559564892457873003263983940819950829497022298967052103291e-02, -1.157718645897628140054089958116866381056430680879332334217267e-02, -5.862096345462925972966025215266179082657169806555503857975278e-03, 6.856635609684880675273184141746359000591385833807880272568038e-03, 1.342626877303679609082208800217479591902967766971379107017011e-03, -3.332854469520006162763300141047111065412307706449049389557931e-03, 1.457529625931728587128588244152604734177322144376309490881599e-04, 1.301177450244135139135787970279897042994109161268159963884641e-03, -3.418351226915427611946547437228006377896519777431057005796358e-04, -3.879018574101327604369144470124819695479087900682219330965466e-04, 2.019719879690326857104208791272390315160018069955787875123234e-04, 7.660058387068576876674274961751262847965101108848090019821555e-05, -7.711145517797584208411720507329584053382646435270054267102827e-05, -3.517483614907445391752737841583832374184046409747387149129674e-06, 2.063442647736885318487206413360228908558806028468062177953960e-05, -3.901164070638425528170558032557368703418425915665413541985623e-06, -3.657500908187104997045760131046655906827644494899206692043298e-06, 1.634369624725637835424610743915128591988676092276368687669255e-06, 3.050880686251999094242671997731089918322345713516567387655763e-07, -3.472468147394389269364673179891460601330730511237974736379548e-07, 3.286558968055159530983261866450459360074591641809187825408848e-08, 4.026255052866908637178682747490340533992340623231336911661711e-08, -1.321332273990056558848617809101876846857728483295631388083263e-08, -1.309465606856955151282041809232358209226373823424148862843577e-09, 1.521614984778521740775073159445241799352681846880808663329946e-09, -2.415526928011130660506395791946234018673860470542996426005750e-10, -4.374986224293654395069947682013996351823060759948583134078918e-11, 2.213662088067662485181472969374945928903854605356443772873438e-11, -3.295790122476585807069953975043096139541415768606924980926275e-12, 1.828188352882424933624530026056448539377272017834175009418822e-13})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies28</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a3cc93df44141d302ef32b6b6e2684e30</anchor>
      <arglist>({4.710807775014051101066545468288837625869263629358873937759173e-05, 8.794985159843870273564636742144073059158975665525081816488582e-04, 7.542650377646859177160195786201116927568410621050693986450538e-03, 3.909260811540534426092083794403768111329778710541126982205076e-02, 1.351379142536410450770749411679708279921694061092200363031937e-01, 3.225633612855224257318486139030596702170126503618082416187649e-01, 5.249982316303355562348293243640252929543774162151269406404636e-01, 5.305162934414858075256978195354516449402692654391295761050628e-01, 2.001761440459844380384404537971725815970574972480152145882083e-01, -2.304989540475825257279397658067038304888129374484095837624889e-01, -3.013278095326417816909366061441334075444383937588485826752087e-01, 3.285787916338710468450547883547348694255260871071954509422161e-02, 2.458081513737595535752949960866466132239832334168533456626848e-01, 3.690688531571127205290633425993077868843846977265847006108551e-02, -1.828773307329849166920408764650763092868965221608724574218473e-01, -4.683823374455167616514752420549419665215987106243491879971921e-02, 1.346275679102260877490923315484152662987698625205479167761416e-01, 3.447863127509970524678534595639646616244376966117385829345554e-02, -9.768535580565244174963692133038973587005628990493154911133358e-02, -1.734192283130589908795581592406238282930530566316914040035812e-02, 6.774789550190933956165341752699717255041141690153626336867769e-02, 3.448018955540951137600471926079622335842207388713342609755316e-03, -4.333336861608628393863254980828284403766309203453808666888800e-02, 4.431732910062988320487418656322338284504389482966303454010563e-03, 2.468806001015186586264188361362046240243934625858343309818244e-02, -6.815549764552309639259447104811254179605050667281644254737890e-03, -1.206359196821849005842466619530619474644989878503490321948471e-02, 5.838816627748944864497370576838809711476027837762897602935327e-03, 4.784863112454241718009916669120329848973107781600157214960003e-03, -3.725461247074254799171427871442937099025589672466088044410521e-03, -1.360373845639692436577650137133777929659265166644839235882291e-03, 1.875998668202795626152766912508562385106168761893900192731562e-03, 1.415672393140464257573780581396205840941849282748250523509874e-04, -7.486749559114629991320679819683227355746847370960399216568306e-04, 1.154656063658921251969297916771881248142872975490882572741198e-04, 2.295790982233456202366621544054366855729175050420515776344878e-04, -8.903901490044488099517361247378396756893227855233897357882978e-05, -4.907713416190250858324783990436748073854807494400738311968278e-05, 3.641401211050802781223450761733180188911730291497201507086247e-05, 4.638664981394294654002871426476885751050837817671843706915388e-06, -1.004326041333422601781848560432120920634648692782357855473103e-05, 1.247900317574834146052381692752796047052443265982232422642017e-06, 1.840363734517769191684379309039277810350620305330900536404818e-06, -6.670215479954892588747450458085225880096882699397256774967304e-07, -1.757461173209842779903676264971918635870906983281392939812547e-07, 1.490660013535362170989340065033061951960933954388633507264360e-07, -8.262387315626556965966429243600984899650039704831080988658278e-09, -1.784138690875710077191713941441263246560738410213624546116655e-08, 5.044047056383436444631252840057862002264087720676808580373667e-09, 6.944540328946226952976704718677697525410051405055662575530111e-10, -6.077041247229010224760245305596307803830053533836849384680534e-10, 8.492220011056382105461206077240377024404404638947591299761197e-11, 1.867367263783390418963879146175452376940453585791428841004699e-11, -8.365490471258800799349289794397908900767054085216008197372193e-12, 1.188850533405901520842321749021089497203940688882364518455403e-12, -6.367772354714857335632692092267254266368934590973693820942617e-14})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies29</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a05d20e73f1ed6efde32c66427ede206a</anchor>
      <arglist>({3.318966279841524761813546359818075441349169975922439988843475e-05, 6.409516803044434540833706729120596322083061716935004987374676e-04, 5.702126517773375434760843998623507494914551464968126455168657e-03, 3.077358022140837676716707336516751814713312018344719150923618e-02, 1.113701169517405304762186166370327770191325772342190715118617e-01, 2.806534559709829376968881262770480606500920092398534229615289e-01, 4.897588047621993143592705932993573539235839610055331620240518e-01, 5.513744327583751951223746071670135992466984391233429663886536e-01, 2.891052383358291634605691113586264061513180158354460952469246e-01, -1.540287344599000542466293779503370141731339982919280951230240e-01, -3.300409489175880520295083779487012611959310539629627124613719e-01, -5.570680007294085781514541931715795784309410235726214400350351e-02, 2.361052361530259415983110734054626770649468357328362426830433e-01, 1.124191748731883764769740670535880543076817816861518667898467e-01, -1.608779885941877360771615465531852333085159940159968393590303e-01, -1.078459499387214201077881957354707913786241153934264316589273e-01, 1.144722958938182579734135930060053286267822797640393386903440e-01, 8.322074716244975790297348835032537357891920536002627784941129e-02, -8.512549261563550232832311331420804581881235448862834507281486e-02, -5.502748952532572320924541450626650067707344725344841099873446e-02, 6.347916458421186633577789314698972361081611994794140119302163e-02, 3.053154327270413646637328212093941030592133225231728964047047e-02, -4.518798127778834515979704475304405691390090327474972089790857e-02, -1.291714255426679462966473962555410660387671182428076570686472e-02, 2.947043187174764111028122319949903667638786379520519899154373e-02, 2.648327307678167915542397563479749119673768286990136051577167e-03, -1.704122457360668969234196743407615179099529206118693044741086e-02, 1.737880332720511164430027824345354801611373419264590068097416e-03, 8.469725493560752287772961661104710791306496373354237126998903e-03, -2.550807127789472659145072247724735637183590942511858255354005e-03, -3.473798989681100630649790255076233970957721666820195620598374e-03, 1.877120925723650133179338154344873477230567340668548016358682e-03, 1.087053942226062966738944397844498417945523630053411148182206e-03, -1.000778327085680541055696707760062870925897014530348262794137e-03, -2.000711363076779808296301110796026470163110202848894744316755e-04, 4.111283454742767033424740543004041500054889660665367490129376e-04, -2.292018041214499897382298271438084577065170236103859181134525e-05, -1.293044840080720609161466939678226852440475312744714379499074e-04, 3.645026068562774967665464216602750761690984830805534178557146e-05, 2.913344750169041218495787251929571015775436967652945386217480e-05, -1.657328395306616289863396387854880512976861409870690029695161e-05, -3.593644804025187638066915189731950450034629392522542962477168e-06, 4.750609246452552850197117564759363194953518317428400241629683e-06, -3.029054592052818286474228294307141792053791695855058563299597e-07, -8.975701750636280734511651941681818767895052287332471537510510e-07, 2.633898386997696553900967704111473475368019612368922599394214e-07, 9.387197411095863026484410601284876812292554863800653292318725e-08, -6.286156922010786166768503252870590953166867739448102804392389e-08, 1.076591906619196137385201975028785139607670319821266803566785e-09, 7.768978854770062238895964639391324551611701293594055935346266e-09, -1.893995386171984147774611076618946011337498790609031626697228e-09, -3.426800863263089001811012278889864200550342566386405676893537e-10, 2.407099453509342962399811991929330725186626582891090462239366e-10, -2.940589250764532582888473974638273664244682541297835986306504e-11, -7.832509733627817032356556582819494794884131433810848844709881e-12, 3.152762413370310423797539876893861621418382024668704492620948e-12, -4.285654870068344101898185073376307686875386259541180967347399e-13, 2.219191311588302960934661700068023727737812918006011019184982e-14})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies30</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>af4bd657652295c5d81bfc58690e2a1dc</anchor>
      <arglist>({2.338616172731421471474407279894891960011661146356580425400538e-05, 4.666379504285509336662000111055365140848987563882199035322085e-04, 4.300797165048069510045016757402827408493482974782286966500398e-03, 2.413083267158837895194919987958311943976725005113561262334092e-02, 9.123830406701570679321575555085899708564500191080751595642650e-02, 2.420206709402140994467599658342919512318194032687898436229538e-01, 4.504878218533178366981351802898336415314944375740699506554771e-01, 5.575722329128364304078082520999850413492571645754785374629734e-01, 3.662426833716279793144871151369089533016299234992584741629624e-01, -6.618367077593731501909741041813726474911212544474895441395148e-02, -3.329669750208556069196849320598850505877494561268613506392514e-01, -1.419685133300829310219026267403758254954270602825020111483505e-01, 1.994621215806643032428990062111230223523226088131364328774921e-01, 1.778298732448367361280250921330425046260289700971176750362566e-01, -1.145582194327077814891518778613672243404957549114393749173137e-01, -1.572368179599938126878197378886501553251711910617673398124611e-01, 7.277865897036442699893544326605244235248713804556715604416632e-02, 1.227477460450093778691578797698150091624353365248212907325446e-01, -5.380646545825707676022015051837304300338645984615639237930800e-02, -8.765869003638366048026572053699028353846982304851342479893827e-02, 4.380166467141773250305407710250135373016604593736480428415303e-02, 5.671236574473569492590636983030617493807140224924978946302257e-02, -3.567339749675960965780819743176056734137251336781389369397564e-02, -3.226375891935220815954913483392725682165778426411705216010280e-02, 2.707861959529418272206848318420006522973840949600186710327776e-02, 1.528796076985739546052896626042375110302102640936712142026221e-02, -1.839974386811734118728169880549148389603890445324127330811811e-02, -5.296859666131086629169938675330494864053932988161015674773617e-03, 1.091563165830488927536881480211929049886878831313700460017968e-02, 6.196717564977244383592534999284255315694546230739551683085460e-04, -5.530730148192003288871383856487027893918513053091795443517653e-03, 8.433845866620933982126003584365932145598126087481400294999080e-04, 2.324520094060099304385756339638431339131122661576649123053845e-03, -8.609276968110423879660725173525347077801305237644122054954659e-04, -7.678782504380918697963922441514742758516706160788123977340073e-04, 5.050948239033467796256544554086554367969638627715114003635557e-04, 1.724825842351709725545759714374272164367933578194910678479473e-04, -2.161718301169633804271038862087964094429005266172702380483361e-04, -8.548305467584070994787824796256108217987765582429940610377190e-06, 6.982008370808327851082027193100914402221658444151889697045071e-05, -1.339716863293971629296314599448901465078920406443516550195793e-05, -1.636152478725426488654528710478856195004608401773950511915162e-05, 7.252145535890469015723401169934327900622894130695550273452916e-06, 2.327549098493686509557358103785598216688723737824121617676858e-06, -2.187267676996166416699555236143059249832615777542412142603694e-06, 1.099474338526203304286307383463498542376432972308342428764576e-08, 4.261662326011572446469849114416378817419458434583398455985144e-07, -1.000414682354500898864979332965559934104686157639553850670490e-07, -4.764379965139453357729154748688006975561934425368712852985388e-08, 2.605442754977625431940885841950955928085338672381046225838880e-08, 5.553397861397053982967618072672572206490972606026556946910028e-10, -3.331105680467578245901976412732595596538702049437802824373020e-09, 6.984862691832182584221096665570313611280449991512869846064780e-10, 1.613622978270904360610418704685783656905979134344922647926295e-10, -9.461387997276802120884525814092001871993910062127702293573920e-11, 1.000105131393171192746337860330428369495110180346654025287492e-11, 3.239428638532286114355931428908079297696045600279108835760520e-12, -1.185237592101582328254231496310584611948560976394420324137742e-12, 1.543997570847620046003616417646988780670333040868954794039905e-13, -7.737942630954405708679963277418806436871098329050829841696327e-15})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies31</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a8cb2b50c01e5bad5c3b98876520c0be9</anchor>
      <arglist>({1.648013386456140748122177817418358316441195236228590958603489e-05, 3.394122037769956699157160165352942212213928231154233571163033e-04, 3.236884068627721221829662672296912258338131668810067169630813e-03, 1.885369161298591269159568944275763468999829139547989648553486e-02, 7.433609301164788697908776495388047669378919816041031344650271e-02, 2.070128744852353286198055444111916450619762837756134323019573e-01, 4.091922000374278563928213235836188963704298775635493549519369e-01, 5.511398409142754983590484577074663132074992263886810324421617e-01, 4.294688082061372955430413148799008354573408538414331312236645e-01, 2.716921249736946422305354732634261873401679092095992827198308e-02, -3.109551183195075186926560285811004715398678229333522634202008e-01, -2.179784855235633521693544507220105631639547435903112747133934e-01, 1.401782887652732681656253206993073895422881511380152633441096e-01, 2.249667114737370933697297905066886078307490136415302624018330e-01, -4.992634916046823977000579399730138693074543903234092797936484e-02, -1.869623608957154494374577196258383009208655076187653847079167e-01, 1.543698842948893409652995335281236231845293548571166883219023e-02, 1.450895009319931981518942907854879059128872873116921504156674e-01, -8.139832273469236863527708715566588550006680549152344840146851e-03, -1.076127733234956326668605511648013952380301953590447106075614e-01, 1.094129745236496925725237900637802669504835743555466811796369e-02, 7.535361174328140695528289751109133941376701984419452638686226e-02, -1.488002661810482202699555987503429289100801979910046913257306e-02, -4.861907546485433003537603385831190109391263542044516048871113e-02, 1.615417156598591113619453864586701665635869166193865651960591e-02, 2.804761936675616906861927211659154977049392281479113764697785e-02, -1.427627527776351943309800140756746087215016194775579070599004e-02, -1.390055293926652880755898888934447671732373519028670201124816e-02, 1.051763948737184089128633441244991643331033825102031908858652e-02, 5.516163573310992566561289762241160214476622662764637181816550e-03, -6.520852375874612553325469682628530079210293774541131381751695e-03, -1.428264223218909891400516038687842292177211292295049238921068e-03, 3.393066776715931928419358796960612411097347419792355896915546e-03, -6.397901106014600492881202314307290077992972755016494062875201e-05, -1.459041741985160943114515221598080223845239255190055621901681e-03, 3.431398296904734438118401084929505912208229684629857530009147e-04, 4.998816175637222614896912406679513231966722440032799024979502e-04, -2.396583469402949615285646688069476140260781708006174912535660e-04, -1.243411617250228669409179807383399199879641177993453588807726e-04, 1.089584350416766882738651833752634206358441308880869184416670e-04, 1.501335727444532997071651937630983442758297688087711521441229e-05, -3.631255157860086164261313773172162991107348698083164489165837e-05, 4.034520235184278839752741499546098778993926344831736074409765e-06, 8.795301342692987765440618030678349427367022581211855857458220e-06, -3.035142365891509630069007852947057220760887215249503512783023e-06, -1.369060230942940782050489751987123955074404782177163471279285e-06, 9.810015422044371573950976088058064384946146188110905321673802e-07, 5.327250656974915426977440959783080593776012130063170688309127e-08, -1.975925129170206248152121156696590501303803187231928513867046e-07, 3.616826517331004805247567218405798591329788122337274956172315e-08, 2.328309713821409644308538888589329921141948539678106680777082e-08, -1.061529602150252306500404266150823962402673780484965538270541e-08, -6.474311687959861398702581539341954438747926255671605657095807e-10, 1.408568151025177427076547804944585301332087108125727813194374e-09, -2.524043954153353306183643702933218308617979467184848456565837e-10, -7.348930032486263904766913919653624379586487437915175106407348e-11, 3.692108808871129411604189196259677640440919369478263728899602e-11, -3.327008967125979929910636246337150851642079794871116041187279e-12, -1.324334917243963163878274345609465717294426628053460151843705e-12, 4.445467096291932163298411852093011459626037560439178917611592e-13, -5.559442050579014337641375730083534521513818164827556763756543e-14, 2.699382879762665647295493928801387173921314576598505507855504e-15})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies32</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>aa79718535fee470d50d1a4e91bd2da90</anchor>
      <arglist>({1.161463302135014885567464100760659332951431420121048996305591e-05, 2.466566906380903352739104211274667134470169443886449124673996e-04, 2.431261919572266100780423071905958127811969678055971488060574e-03, 1.468104638141913563547809006402194831107662001343421893488086e-02, 6.025749912033537081745451975527967031851677384078997261920024e-02, 1.757507836394388988189299915753348505208376399651864661397588e-01, 3.675096285973496361995340339143234125206079560406868595968025e-01, 5.343179193409538322901117858552186425529774700290587495921679e-01, 4.778091637339484033555130814414794130354053753675509287934741e-01, 1.206305382656178269538098710665261299391507308342013788891222e-01, -2.666981814766755535489784087869865024226542605534080371507405e-01, -2.774215815584272153338153320303401666681294506143291967655666e-01, 6.471335480551623831000090095167664918448659157720155321560811e-02, 2.483106423568801736064852157222867588791898170114101300999760e-01, 2.466244483969740441701479334808723214802614938081258920635302e-02, -1.921023447085468984341365278247990525863123891147783426068990e-01, -4.899511718467173853355943225576377418394280156945986899417475e-02, 1.452320794752866460838830744051944832326998342053148426312341e-01, 4.440490819993974022640619534046603571086531544468421519143629e-02, -1.094561131160893831027722774343269232755171130623890041619420e-01, -2.962787250844770491204452379051215505049068645551070779367843e-02, 8.087414063848395744090831590426327690818854671836423275412813e-02, 1.410615151610660772869738802931740150275269382463799031013905e-02, -5.692631406247843550478416271158537960555270097953330567652364e-02, -2.380264464932573834443178362086503847328134994591954135879789e-03, 3.705145792354468010437633458013030898015496905609424004450953e-02, -4.145907660827218781460700428862611061267328108653649653634276e-03, -2.166282283639119347634778516947485598599029367518033869601702e-02, 6.167527310685675112579059689520105004744367282412921739811164e-03, 1.101740071540688116532806119564345712473051769079712407908648e-02, -5.411568257275791208581502410752383050600045942275647685361370e-03, -4.649216751184411528658094984504900172989190128905887602541396e-03, 3.627224640687864960122122984391704782343548385375321260251988e-03, 1.468955100468467772528811782840480639166582822577191079260543e-03, -1.964740555821778254183647540656746450092725858126595984907304e-03, -2.211678729579097916278097586914956834196749138610403102772710e-04, 8.673058518450555343925662389563539890596549655683386287799624e-04, -1.024537310607396186949656796812972062290796122915930356634122e-04, -3.059654423826911750479261161552574500739091332121504634422577e-04, 1.053915461739828114700905192091104141076083602686374410146603e-04, 8.103678329134838389828091896334156224227821362491626044950428e-05, -5.259809282684322782648914338377962890245975842272425408122506e-05, -1.294045779405512723950480259110995722517019870286295908085366e-05, 1.824268401980691220603850117995712615809177092802967489081228e-05, -6.361781532260254953363913076575914206506177493714496098327288e-07, -4.558309576264423135123964145585288808181431652781253437738445e-06, 1.202889036321620990296134494079846952404216422923750605507047e-06, 7.560047625595947819392627283726711361273296630256477108501994e-07, -4.285970693151457255418342315045357407199066350632593899896712e-07, -5.003361868748230293692887222336390314786090450819216035110269e-08, 8.965966311957728376981484572655177545054433542721057470726361e-08, -1.219924359483373093110396748985081720383992859961285213840740e-08, -1.104383021722648979552131128575075255513372249283096583736746e-08, 4.250422311980592983740943309197245384991941251563471671065543e-09, 4.384387799940474369553236949848427579687147486892033587998023e-10, -5.881091462634605628881794361152305108432139465417759716875076e-10, 8.904723796221605490455387579189371137903330749397374037644960e-11, 3.263270741332907875981844980104948375955551273115386408552080e-11, -1.430918765169202320188022211739750594608742928641485026836608e-11, 1.075610653501062115165734990153347111902874668945095034791947e-12, 5.361482229611801638107331379599434078296259332654994508124989e-13, -1.663800489433402369889818192962259823988673359967722467427927e-13, 2.000715303810524954375796020597627467104635766752154321244151e-14, -9.421019139535078421314655362291088223782497046057523323473331e-16})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies33</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a939e583852bdfc636e3696db658b5558</anchor>
      <arglist>({8.186358314175091939858945975190102731733968885547217619434602e-06, 1.791016153702791479424389068736094134247294413108336017758506e-04, 1.822709435164084208084617771787691709255513374281497713580568e-03, 1.139594337458160925830840619716397130445853638888472948832932e-02, 4.861466653171619508385707681587366397164931431125053574327899e-02, 1.481863131800528081784673514426737436792606299953305691300616e-01, 3.267181301177075783930752787756046348844272437670999719562429e-01, 5.093761725149396552227892926384090200953139820961482931291482e-01, 5.112547705832674655425831875568453973369927971748064975152374e-01, 2.095823507130554216526494469993023406452629154801126958766008e-01, -2.042026223985421049629055102642279430174095014493415546881477e-01, -3.159974107665602561905181464284910961862968513875028980451424e-01, -1.927833943695275915600583425408664108893845271616240406358226e-02, 2.454206121192791114179964351253140999836791489738418857473689e-01, 9.985155868033815698139640215477639365289384281516885362929979e-02, -1.714280990518593279308738113273443832545615219650436927029674e-01, -1.108441331167107910806084983056783194189909198734302929909672e-01, 1.219678564037346149389134584371009777591763921148126952722200e-01, 9.478808805061595889263191779090571160237408179346345390888721e-02, -9.114696835133148913093153757138373418923462847746880902676089e-02, -7.030248505405615921453280814171665167171986608963193275084895e-02, 7.019114394099653254998935842432841393915841096633514680190145e-02, 4.573456189389667743139040427641638967843459421665709740086516e-02, -5.347125133582228919431110824663168583260050383336359554980188e-02, -2.524858297747649929258392207837724793937727346177294684700378e-02, 3.868706076024496481748675031852528047303323816250150793091832e-02, 1.070326582001954942654534968137727769698168853186071888736311e-02, -2.572876175473297336123211392278301875687760837710204579628265e-02, -2.167758617353607324783298657172830203896433848418061622436727e-03, 1.531695411585766548347442266431874060229304787191589430967538e-02, -1.594288782414604768637856446111392724059836934455189837500244e-03, -7.953540387057939240459305406538116220678495240302592677582773e-03, 2.389062408165908575935815973439728988151836094753689966108405e-03, 3.480800953405711999411461002429227385937942254778524257436278e-03, -1.860718214455795912074482150710567824317228203897000129729967e-03, -1.204309257604658876916644980097327372892008586047095719636829e-03, 1.074380696351291355073899234941719080473877020595209197706651e-03, 2.727305847336937211749282358350196461733595290569540045817329e-04, -4.908329007590351474487792254066540683724948757382104652497458e-04, 4.393166251766185755059005296958129844094063524324718175254673e-06, 1.780431898251245351831728023200069586928513661382622116969992e-04, -4.160438516273709306234368807933932360567787692918883118883736e-05, -4.929564423417301834310231482621574127409950921583062559483686e-05, 2.423335398816890365621188379922041046073808819182024026589770e-05, 9.070805757828453800203677464921508178468256685438211818575040e-06, -8.866121366757736169176034432364298134186929098274651022820760e-06, -3.607516102879771631230351118595069330196155459105589342866625e-07, 2.288371276141527305481395545993763010565968667577768164201792e-06, -4.426923407952870147984002129341809185622768353983550670755106e-07, -3.985791291985944076942626511739220753169387460984290019185514e-07, 1.822443332571053437467128998002798233969112236553215291639303e-07, 3.377972703730854377516206663481869099376154259897212784144779e-08, -3.987838198518880722819502850814936369197384392561970319349663e-08, 3.672863576838181340505563759379169099717712645283448779390320e-09, 5.111211857347453839549366593998758891130921028374576213256027e-09, -1.671392677251932495173219614104411841891545601521784559793012e-09, -2.496402105246193648073519269370197331176405371538404298745013e-10, 2.426833102305682309891302883361232297664099485514601790344279e-10, -3.049574453945863430361296931455141500128170151643206937547928e-11, -1.420236859889936792437077844940412749343225644487770840543290e-11, 5.509414720765524548752673631197714447818740985929081064907524e-12, -3.343481218953278765982532722689984725170758193566174566492199e-13, -2.152488386833302618520603545685994753329478275805993737095214e-13, 6.214740247174398315576214699577230693021307854673557214652751e-14, -7.196510545363322414033654470779070592316600780697558361083151e-15, 3.289373678416306368625564108782095644036415401902518812978798e-16})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies34</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>ae0b85b53fb751200edb000c34cf3f3d4</anchor>
      <arglist>({5.770510632730285627466067796809329117324708919047900817738025e-06, 1.299476200679530037833484815390569400369432658207722720405084e-04, 1.364061390059049998200014449396877439591680435610837369411339e-03, 8.819889403884978803182764563095879335330977939541630862804757e-03, 3.904884135178594138905026219591569204043816577941517019631916e-02, 1.241524821113768081954449898210969172708199672428635378051285e-01, 2.877650592337145629334256618087718872558560120999651277991839e-01, 4.784787462793710621468610706120519466268010329031345843336104e-01, 5.305550996564631773133260223990794445605699030503652382795600e-01, 2.903663295072749510455945186199530115755664977934564128822650e-01, -1.282468421744371672912377747048558427612774932943748628650824e-01, -3.315253015083869417715548463087537345035828886426345397256876e-01, -1.038919155156404718287260506925867970596448618647006698388596e-01, 2.169072201874275950610018667099322465619408030256534197819784e-01, 1.666017504122074437311574334509261366682993700573488534577890e-01, -1.273373582238011562843862636988693890108793629966541695807247e-01, -1.609249271778668063014799490429649196614628857267382976958607e-01, 7.799184693794810738265349531832015087096882277333968473726399e-02, 1.341259602711361284802399913977387999358280900708582462625539e-01, -5.448296806413904636632671383140642554265865948686157271017286e-02, -1.029475969928140852342073823689090498245496056845473569066667e-01, 4.357609464963129726428486610925800727137724136370669421246609e-02, 7.318523543679560555546221335452045680757998947493883124934567e-02, -3.701283841786244960356402125554190040750079009127461655784927e-02, -4.743855964527776247220681410983851377889756018716427358008296e-02, 3.073974657395934459931226513844134346305562928466993208164603e-02, 2.722835075635419610095839895805858855202745897718117731496534e-02, -2.367173792282636485046786438094940427456079528043555566867110e-02, -1.314398001665716086105827506126287041342680578404007359439612e-02, 1.640937419986519252112261495537409592363156309874473310057471e-02, 4.713649260999809905918876125437488856235874027077755004539205e-03, -1.004550670836151917439146861146431000364858401181337134891421e-02, -6.194748845153872839014356621835501857322345445234809347431098e-04, 5.334950768759936032170270195983921511565539100791906952901398e-03, -7.692127975067836975989490900561029844887285335804349474993607e-04, -2.399453943537055863933124827688081952701780599883067560501870e-03, 8.589959874363661955444898475746536583497522107459291718900058e-04, 8.751999064078688732610570055224339733760304773327228476255647e-04, -5.527355762144197975516415296735124460550632283763688359649888e-04, -2.326732140233531635428863212833942245597361085708567528230733e-04, 2.650772397558057819755811309071002543822145660933016957735937e-04, 2.660050018453441903046828468025589086403126180798464347801678e-05, -9.914697770780134603580350758869378471802751837608461971022567e-05, 1.353117227249649581251887376414486225127346352042209141315562e-05, 2.844951419697807376503080001943765930601242225183893658540032e-05, -1.057657494257950623848316304755218120233253479317574337409622e-05, -5.710826510998303938275050074333400305512451419983646591762318e-06, 4.169871758547028398316761659984928804362023643629741358799744e-06, 4.979718101421307748081857636471761057429219265531618602960147e-07, -1.116306534817008428597995070751765080383261658112656948526954e-06, 1.448195708333185127061180618150009526758658641231104901703561e-07, 2.025990666667859216690536885693725545344933235432307649205497e-07, -7.526701740412589411177481797841044281662555785969415398369019e-08, -1.990346501531736915866180448337614967570744211158241514589121e-08, 1.740423332936068076497051274445147160190783847854409836489662e-08, -8.665744261368722215864741166245385888818567571145958531936939e-10, -2.316501946995482751582294240136010067415084499025753117941001e-09, 6.446378210323402313101214894500231181606520211579581132442548e-10, 1.300410318609415248880403259300467720631189120978928377152233e-10, -9.904774537632409015479530333979124540183199174591377762845227e-11, 1.004208735461769864836516428998306778031143650101842361622330e-11, 6.080125354000167254059025929915591291115751734288584563131636e-12, -2.107879108915301546285370395443778864676275235126044599683271e-12, 9.799451158211597727901178520526388692140586041163624252991805e-14, 8.579194051799733179793112298652600511486581216528683482143106e-14, -2.317083703906408481078257081903089523234020423092175261925515e-14, 2.587338381935699555813538163144986688834142571207152879144731e-15, -1.148944754480590128244815794312606245147888158018823490936280e-16})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies35</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a9ef21ae172498bbd4645a909c8dcecca</anchor>
      <arglist>({4.067934061148559026665247110206084571051201477121972612218005e-06, 9.421469475576740631603027533116630224451049736050903361458759e-05, 1.019122680375098109319314672751485080202557607467199213778085e-03, 6.807292884319132011971333979015625113494050642797397817625326e-03, 3.123628851149071453063391210769353068187088999495893257051179e-02, 1.034044558614783789938787754929279183985553322796063517049140e-01, 2.513073789944933128513251971488905042866779761014740192816902e-01, 4.435927392240354378183910489448494594782039032807956294826105e-01, 5.370084275091661028670690231716974547580034932361053607723887e-01, 3.603456405180473278744458573988718422538114217890792270621563e-01, -4.388388187393404111343479394097224312100349011932028865098625e-02, -3.238228649121161212147302807993176715625480327235512530593160e-01, -1.817869767667278325788350264528191676841493369460849123538616e-01, 1.660413574907809195438433327470947940538097914525298064477785e-01, 2.172992893210892977675493456199559114036326358517672106972956e-01, -6.526287131067753892154895911331108284007380738865652420304233e-02, -1.919195892985939528760786800798636198516495957924798820500876e-01, 1.930954466601835091947734585938109944647435243484967057775110e-02, 1.552924803962371144206753760712566993987319378965231186477630e-01, -4.752680834111350445288110998030979143710864689041902167119118e-03, -1.205855226433935545076589480704957722635324456812322150437989e-01, 4.734229172641948763293980314992213293971770695480616789828384e-03, 8.991354757072954417865374195261962983644048998218233900481856e-02, -9.318558949903924837875002823617504227246562152671894579504378e-03, -6.335603744044346612098887534020545705731671718057964802006671e-02, 1.322854958503655524455929847605110719648746890497356808289302e-02, 4.125469306470509212749750814299126656151504805845417994651417e-02, -1.436683978422007182104025173214012797788904894291716373493525e-02, -2.416949780166026740294880681731084091264533168816746227537030e-02, 1.276645671565674419403918018742432714973656598227939824940035e-02, 1.228943600811871086161967625814297050611100200023898377949151e-02, -9.577797899235709998147309703713518608283233882793489733491642e-03, -5.085991649233429881797636583578921194675393807761154549733547e-03, 6.137754586740521089596801883631921221145712545042519987641234e-03, 1.428088794070762107355585870669842132609159040625895090070111e-03, -3.357644380922383229567732565298665639037348585961127075507937e-03, 7.615969435172736546769649923895317451534703066016116257300160e-06, 1.549637469702362975561719246539787717204438637997824935787688e-03, -3.346692164250854961608526121524596908041109918361306282201310e-04, -5.864810318991817532175809224131456738367101035694188223408841e-04, 2.648328819961289039302810122699710966048565368047575218693134e-04, 1.700012283661249043584690194716767771204207742625746308522935e-04, -1.365883072261161602559926714744746422567509177443594045709653e-04, -2.976995962848509743944225866488519668585242655980656646544319e-05, 5.304143122913310222538317980686374696005605533475685587486683e-05, -2.437001526827789860990429478540556752694389693432668831073769e-06, -1.572442077270281693663288966405861215692805972737981986121447e-05, 4.308047861716731191350493437937513220737450410132878032163179e-06, 3.353345862871309889390877168046133657377105681618708355266688e-06, -1.895929617693153288493891051875444439753318548105998166574535e-06, -3.903931733287306166657519468494511920760767388397825775326745e-07, 5.302368616904760917074352633915743250769600635829229600812520e-07, -3.700308378205124537986402644918879149894035910106489082512364e-08, -9.990396944534900755781728477561240762191443422318249128866740e-08, 3.008188650719066928230268918661718274504955045022550217051301e-08, 1.084902733789934825266560240100449884702749303326571747323086e-08, -7.458116552893037631192407611262788593505988638365840409367117e-09, 5.897951310384361575470355861162022501172491937837712969865619e-11, 1.030823345485433383811700481488557422005210168069163779730908e-09, -2.433545573751672936168877250405940817227367937230289801251648e-10, -6.407938256501889018430608323235974406219193176918284664973727e-11, 4.000536627253744510742788201354093006471710416671002244302586e-11, -3.125639357108557540598098228678150768528121565391376265627294e-12, -2.567065476155081449204643852428401530283519685638256074752850e-12, 8.015088533687900921948605418789324826115616416343391081288979e-13, -2.597954328893848084315198205094389145706680129208998638802995e-14, -3.397720856796267431956783825659069596940335130100871912329556e-14, 8.624037434720089202680337663692777682810714650060805832406135e-15, -9.298012529324185420921555664719863501848315099116725184370339e-16, 4.014628712333488654318569164614220308046021091178184654250982e-17})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies36</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>acc368cefd23cd05c3ca28527fb2275fd</anchor>
      <arglist>({2.867925182755946334630479473029238615535511775894262711054705e-06, 6.826028678546358691748629102209605362240344266505035981791715e-05, 7.602151099668488285869792677106082100141275054892389379198545e-04, 5.240297377409884366201603524392995696042174937194435235003941e-03, 2.489056564482796484885927333959115579403023347044729739255255e-02, 8.565209259526409083864716995521111486437594750377856524772704e-02, 2.177569530979008149637945915719999746248969705650625533415876e-01, 4.064336977082553467407793990250384445903151630768558142125382e-01, 5.322668952607286914777444748641462027213554723153906901129337e-01, 4.178753356009697863620634559374236455222275302996931178265919e-01, 4.397519752934862993862182898358763783110745559238982179690132e-02, -2.944210395891145711100715969898758940722458887377844633443675e-01, -2.468070369781255270524798278622698446566520718230313889086016e-01, 9.811420416311477050518401371401568038943437322299913514049728e-02, 2.465372776089742110529709111809595434656418762898152706621356e-01, 7.278515095792229009687682299460382878643139026668958884429641e-03, -1.993372056086496198603363400094784142714162256792182570541036e-01, -4.586140074639271639145126228774831743002971373998329604574394e-02, 1.541062366276428841776316300420654875883842819413623395358262e-01, 5.027618007353842862036816972809884096761706036019748316890913e-02, -1.188037543101356316801816931383547446073152951044444224449501e-01, -3.988085357551317584091699967924044034100374257075864260934102e-02, 9.115678225801654406336059281306715151058903055370522031843771e-02, 2.503872144956848989919484296709846860569180993040383621980546e-02, -6.820901663681751124880436344265538690580358108714540763125119e-02, -1.131910031681742794381808082173695022123056280821611354577883e-02, 4.851308354780908538616267662315735632292989749013261207046367e-02, 1.424972661765391603147802607378542396323429657660009755652404e-03, -3.198072067763969654470293513742344601172739688274251641873778e-02, 3.984040198717004857397179486790082321314291366656151213429068e-03, 1.906359478062535932877576164368198274858108513696832728889209e-02, -5.657813245058818380424016973516714570499161434975761798379020e-03, -9.990263473281372348001743806489172665465685056975652497503772e-03, 5.022989106665829004699819220796538830393945994687289792465541e-03, 4.413484835350575251918616780287775585471012556848037301025999e-03, -3.484541445404883311209541395428535732697661971818727286003028e-03, -1.503074066296643749549363655363411879858070202740814054964603e-03, 1.990793771851737270404293245701878186600899439513475823305914e-03, 2.776812795712026068152384207605140383490242756921936501940389e-04, -9.463403823261101964604918059447913047725482130063492242779878e-04, 8.614565758992702032613879159402330909634737204578606399403107e-05, 3.693507284967510502620040341882236687749563414433432842567511e-04, -1.155118895843527096848376999413102395191976350936666573818799e-04, -1.131899468084665671727391922924411467938450743565106978099456e-04, 6.694741196930590257104231749283786251555566773398199990337698e-05, 2.375106683660860777161950832380341362257503761490580896617678e-05, -2.731390824654337912922346414722045404779935825834384250023192e-05, -1.183471059985615942783182762352360917304348034947412986608322e-06, 8.372218198160788432628056043217491552198857358432112275253310e-06, -1.586145782434577495502614631566211839722879492827911790709498e-06, -1.870811602859180713762972281154953528056257451900381097476968e-06, 8.311421279707778528163597405935375886855029592150424544500718e-07, 2.548423522556577831218519052844387478819866531902854523544709e-07, -2.455377658434232699135878286794578515387138194247693201846263e-07, 2.753249073339512254085076456700241929492720457889076058451072e-09, 4.799043465450992009934526867650497683545716858606119786327559e-08, -1.156093688817008406756913949175208452083765368825442482226093e-08, -5.612784343327791397474114357094368557982413895802980814813369e-09, 3.138841695782424018351567952158415003571380699236147752239001e-09, 1.090815553713751810964713058800448676068475673611349566405716e-10, -4.512545778563249634425200856088490195004077806062978067796020e-10, 8.962418203859611987065968320295929679774693465791367610044773e-11, 3.037429098112535221800013609576297196061786927734556635696416e-11, -1.599716689261357143200396922409448515398648489795044468046420e-11, 8.876846287217374213524399682895564055949886050748321818411161e-13, 1.070969357114017002424433471621197579059927261727846375968378e-12, -3.029285026974877268896134589769473854669758797446795757329862e-13, 5.542263182639804235231685861028995158694397223907295269180336e-15, 1.338071386299105896025578761458472955294763310766371178363783e-14, -3.204628543401749860439316638848579711789176444320134355253750e-15, 3.339971984818693213132578777712503670014459411167839211495237e-16, -1.403274175373190617489823209168013922564353495443487431242610e-17})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies37</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a22227a818d804d3fce02a290a07471e9</anchor>
      <arglist>({2.022060862498392121815038335333633351464174415618614893795880e-06, 4.942343750628132004714286117434454499485737947791397867195910e-05, 5.662418377066724013768394373249439163518654840493603575144737e-04, 4.024140368257286770702140124893772447952256842478891548092703e-03, 1.976228615387959153244055502205017461538589475705618414896893e-02, 7.058482597718160832030361890793007659963483925312132741868671e-02, 1.873263318620649448028843491747601576761901656888288838192023e-01, 3.684409724003061409445838616964941132670287724754729425204047e-01, 5.181670408556228873104519667534437205387109579265718071174178e-01, 4.622075536616057145505448401528172070050768534504278694229363e-01, 1.308789632330201726057701201017649601034381070893275586898075e-01, -2.461804297610834132869018581145720710365433914584680691693717e-01, -2.943759152626617722808219575932673733674290772235644691367427e-01, 1.967150045235938977077768648740052380288156507222647187301894e-02, 2.515232543602686933435224095078166291442923992611593827552710e-01, 8.180602838721862339029076982652411696000045533716726027662147e-02, -1.819622917786080007408824256525225216444443143868752611284260e-01, -1.084517138233017845554078812341876568514835176341639783558543e-01, 1.299296469598537527842528895259188653120602318620944502979726e-01, 1.017802968388141797470948228505865617480048287983176581607964e-01, -9.660754061668439030915405045955772715988585374771282291315496e-02, -8.233021190655740867404073660920379414988302492018783774702028e-02, 7.504761994836017933579005072594245435071674452882148228583865e-02, 5.956741087152995245435589042520108066877114768216272503684398e-02, -5.925681563265897095153806724965924334077555174281436189512239e-02, -3.825382947938424882011108885090442116802994193611884738133373e-02, 4.580794415126833246633256156110381805848138158784734496981778e-02, 2.097280059259754883313769469036393294461497749083921162354229e-02, -3.352358406410096994358662875913243067234786296009238949920582e-02, -8.833493890410232394064187990625563257107429109130726291528648e-03, 2.261865154459947356571431658958802912061105608212828675323452e-02, 1.690472383484423743663952859090705636512807161536954018400081e-03, -1.376398196289478433857985486097070339786225136728067000591187e-02, 1.519305778833399218481261844599507408563295102235964076544334e-03, 7.387757452855583640107787619408806919082115520707105052944171e-03, -2.248053187003824706127276829147166466869908326245810952521710e-03, -3.394523276408398601988475786247462646314228994098320665709345e-03, 1.816871343801423525477184531347879515909226877688306010517914e-03, 1.263934258117477182626760951047019242187910977671449470318766e-03, -1.111484865318630197259018233162929628309920117691177260742614e-03, -3.280788470880198419407186455190899535706232295554613820907245e-04, 5.490532773373631230219769273898345809368332716288071475378651e-04, 1.534439023195503211083338679106161291342621676983096723309776e-05, -2.208944032455493852493630802748509781675182699536797043565515e-04, 4.336726125945695214852398433524024058216834313839357806404424e-05, 7.055138782065465075838703109997365141906130284669094131032488e-05, -3.098662927619930052417611453170793938796310141219293329658062e-05, -1.639162496160583099236044020495877311072716199713679670940295e-05, 1.354327718416781810683349121150634031343717637827354228989989e-05, 1.849945003115590390789683032647334516600314304175482456338006e-06, -4.309941556597092389020622638271988877959028012481278949268461e-06, 4.854731396996411681769911684430785681028852413859386141424939e-07, 1.002121399297177629772998172241869405763288457224082581829033e-06, -3.494948603445727645895194867933547164628229076947330682199174e-07, -1.509885388671583553484927666148474078148724554849968758642331e-07, 1.109031232216439389999036327867142640916239658806376290861690e-07, 5.350657515461434290618742656970344024396382191417247602674540e-09, -2.252193836724805775389816424695618411834716065179297102428180e-08, 4.224485706362419268050011630338101126995607958955688879525896e-09, 2.793974465953982659829387370821677112004867350709951380622807e-09, -1.297205001469435139867686007585972538983682739297235604327668e-09, -1.031411129096974965677950646498153071722880698222864687038596e-10, 1.946164894082315021308714557636277980079559327508927751052218e-10, -3.203398244123241367987902201268363088933939831689591684670080e-11, -1.398415715537641487959551682557483348661602836709278513081908e-11, 6.334955440973913249611879065201632922100533284261000819747915e-12, -2.096363194234800541614775742755555713279549381264881030843258e-13, -4.421612409872105367333572734854401373201808896976552663098518e-13, 1.138052830921439682522395208295427884729893377395129205716662e-13, -4.518889607463726394454509623712773172513778367070839294449849e-16, -5.243025691884205832260354503748325334301994904062750850180233e-15, 1.189012387508252879928637969242590755033933791160383262132698e-15, -1.199280335852879554967035114674445327319437557227036460257649e-16, 4.906615064935203694857690087429901193139905690549533773201453e-18})</arglist>
    </member>
    <member kind="variable">
      <type>const WaveletData</type>
      <name>Daubechies38</name>
      <anchorfile>http://astro-informatics.github.io/sopt/namespacesopt_1_1wavelets.html</anchorfile>
      <anchor>a1a2a4af5fc67d3569fe82647d8b7de94</anchor>
      <arglist>({1.425776641674131672055420247567865803211784397464191115245081e-06, 3.576251994264023012742569014888876217958307227940126418281357e-05, 4.211702664727116432247014444906469155300573201130549739553848e-04, 3.083088119253751774288740090262741910177322520624582862578292e-03, 1.563724934757215617277490102724080070486270026632620664785632e-02, 5.788994361285925649727664279317241952513246287766481213301801e-02, 1.600719935641106973482800861166599685169395465055048951307626e-01, 3.307757814110146511493637534404611754800768677041577030757306e-01, 4.965911753117180976599171147718708939352414838951726087564419e-01, 4.933560785171007975728485346997317064969513623594359091115804e-01, 2.130505713555785138286743353458562451255624665951160445122307e-01, -1.828676677083358907975548507946239135218223185041410632924815e-01, -3.216756378089978628483471725406916361929841940528189059002548e-01, -6.226650604782432226643360160478765847565862101045597180310490e-02, 2.321259638353531085028708104285994998671615563662858079262996e-01, 1.499851196187170199586403453788927307298226028262603028635758e-01, -1.417956859730596216710053144522330276392591055375830654519080e-01, -1.599125651582443618288533214523534937804208844386102639177693e-01, 8.563812155615105741612217814369165313487129645536001850276987e-02, 1.414147340733826800884683119379170594092606174915755283496153e-01, -5.658645863072738145681787657843320646815509410635114234947902e-02, -1.147311707107443752394144019458942779715665489230169950201022e-01, 4.309589543304764288137871223616030624246568683595408792078602e-02, 8.720439826203975011910714164154456762073786124233088471855868e-02, -3.660510340287429567372071039506772372567938710943432838908247e-02, -6.176620870841315993604736705613246241897497782373337911398117e-02, 3.198987753153780630818381136366859026137035450576631134176875e-02, 4.005498110511594820952087086241114309038577379366732959648548e-02, -2.689149388089451438550851767715967313417890393287236700072071e-02, -2.311413402054931680856913553585621248925303865540203357180768e-02, 2.090464525565524340215982365351342094670261491526831672682244e-02, 1.129049727868596484270081487761544232851115891449843967151657e-02, -1.470188206539868213708986402816605045648481224662435114088245e-02, -4.131306656031089274123231103326745723188134548520938157995702e-03, 9.214785032197180512031534870181734003522861645903894504302286e-03, 5.625715748403532005741565594881148757066703437214522101740941e-04, -5.071314509218348093935061417505663002006821323958752649640329e-03, 7.169821821064019257784165364894915621888541496773370435889585e-04, 2.400697781890973183892306914082592143984140550210130139535193e-03, -8.448626665537775009068937851465856973251363010924003314643612e-04, -9.424614077227377964015942271780098283910230639908018778588910e-04, 5.810759750532863662020321063678196633409555706981476723988312e-04, 2.817639250380670746018048967535608190123523180612961062603672e-04, -3.031020460726611993600629020329784682496477106470427787747855e-04, -4.555682696668420274688683005987764360677217149927938344795290e-05, 1.262043350166170705382346537131817701361522387904917335958705e-04, -1.155409103833717192628479047983460953381959342642374175822863e-05, -4.175141648540397797296325065775711309197411926289412468280801e-05, 1.334176149921350382547503457286060922218070031330137601427324e-05, 1.037359184045599795632258335010065103524959844966094870217687e-05, -6.456730428469619160379910439617575420986972394137121953806236e-06, -1.550844350118602575853380148525912999401292473185534395740371e-06, 2.149960269939665207789548199790770596890252405076394885606038e-06, -8.487087586072593071869805266089426629606479876982221840833098e-08, -5.187733738874144426008474683378542368066310000602823096009187e-07, 1.396377545508355481227961581059961184519872502493462010264633e-07, 8.400351046895965526933587176781279507953080669259318722910523e-08, -4.884757937459286762082185411608763964041010392101914854918157e-08, -5.424274800287298511126684174854414928447521710664476410973981e-09, 1.034704539274858480924046490952803937328239537222908159451039e-08, -1.436329487795135706854539856979275911183628476521636251660849e-09, -1.349197753983448821850381770889786301246741304307934955997111e-09, 5.261132557357598494535766638772624572100332209198979659077082e-10, 6.732336490189308685740626964182623159759767536724844030164551e-11, -8.278256522538134727330692938158991115335384611795874767521731e-11, 1.101692934599454551150832622160224231280195362919498540913658e-11, 6.291537317039508581580913620859140835852886308989584198166174e-12, -2.484789237563642857043361214502760723611468591833262675852242e-12, 2.626496504065252070488282876470525379851429538389481576454618e-14, 1.808661236274530582267084846343959377085922019067808145635263e-13, -4.249817819571463006966616371554206572863122562744916796556474e-14, -4.563397162127373109101691643047923747796563449194075621854491e-16, 2.045099676788988907802272564402310095398641092819367167252952e-15, -4.405307042483461342449027139838301611006835285455050155842865e-16, 4.304596839558790016251867477122791508849697688058169053134463e-17, -1.716152451088744188732404281737964277713026087224248235541071e-18})</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>sopt_contributors</name>
    <title>Contributors</title>
    <filename>http://astro-informatics.github.io/sopt/sopt_contributors</filename>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Sparse OPTimisation Library</title>
    <filename>http://astro-informatics.github.io/sopt/index</filename>
  </compound>
</tagfile>
