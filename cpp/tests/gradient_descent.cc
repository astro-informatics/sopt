#include <catch2/catch_all.hpp>
#include "sopt/gradient_descent.h"
#include <random>

uint constexpr N = 10;

TEST_CASE("Gradient Descent with flat prior", "[GradDescent]")
{
    using namespace sopt;
    
    const Vector<float> target = Vector<float>::Random(N);
    float const sigma = 0.5;
    float const gamma = 0.1;
    uint const max_iterations = 100;

    auto const grad_likelihood = [](const Vector<float>&x, const Vector<float>&y){return (x-y);};
    auto const grad_prior = [](const Vector<float> &x){return 0*x;};

    Vector<float> init_guess = Vector<float>::Random(N);

    auto Phi = linear_transform_identity<float>();

    algorithm::GradientDescent<float> gd(grad_likelihood, grad_prior, target);
    
    algorithm::AlgorithmResults<float> results = gd(init_guess);

    CHECK(results.good);
    CHECK(results.result.isApprox(target, 0.1));
}

TEST_CASE("Gradient Descent with smoothness prior", "[GradDescent]")
{
    using namespace sopt;
    std::mt19937_64 rng;
    std::uniform_real_distribution<float> noise(0, 0.2);

    Vector<float> data(N);
    for(uint i = 0; i < N; i++)
    {
        data(i) = sin((M_PI/(N-1))*i) + noise(rng);
    }

    Vector<float> perfect(N);
    for(uint i = 0; i < N; i++)
    {
        perfect(i) = sin((M_PI/(N-1))*i);
    }

    float const sigma = 0.5;
    float const gamma = 0.1;
    uint const max_iterations = 100;

    auto const grad_likelihood = [](const Vector<float>&x, const Vector<float>&y){return (x-y);};
    auto const grad_prior = [](const Vector<float> &x)
    {
        Vector<float> grad(x.size());
        grad(0) = x(0);
        grad(x.size()-1) = x(x.size()-1);
        for(uint i = 1; i < x.size()-1; i++)
        {
            // Push values to be roughly in line with neighbours
            // Hand wavey kind of smoothness prior
            grad(i) = x(i) - 0.5*(x(i-1) + x(i+1));
        }
        return grad;
    };

    Vector<float> init_guess = Vector<float>::Random(N);

    auto Phi = linear_transform_identity<float>();

    algorithm::GradientDescent<float> gd(grad_likelihood, grad_prior, data);
    
    algorithm::AlgorithmResults<float> results = gd(init_guess);

    CHECK(results.good);
    CHECK(results.result.isApprox(perfect, 0.1));
    CHECK((results.result - perfect).squaredNorm() < (data-perfect).squaredNorm());
}